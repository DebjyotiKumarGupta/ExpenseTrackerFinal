import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenseapp/Controller/ChartController/chart_controller.dart';
import 'package:expenseapp/Screens/Home/home_transaction_tile.dart';
import 'package:expenseapp/Screens/LogIn/login_screen.dart';
import 'package:expenseapp/Screens/Profile/profile_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:motion/motion.dart';

import '../../Controller/authentication.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ChartController chartController = Get.put(ChartController());

  @override
  void initState() {
    super.initState();
    chartController.getTransactionList();
  }

  @override
  Widget build(BuildContext context) {
    void filterTransactions(DateTime startDate, DateTime endDate) {
      List<dynamic> filteredTransactions =
          chartController.recentTransactions.where((transaction) {
        DateTime transactionDate =
            (transaction["dateTime"] as Timestamp).toDate();
        return transactionDate.isAfter(startDate) &&
            transactionDate.isBefore(endDate);
      }).toList();

      // Update the list of transactions
      chartController.addtofiltered(filteredTransactions);
      log("Filtered");
      // Update the UI
      print("Filtered ${chartController.filteredtransactions}");
      setState(() {});
    }

    final auth = FirebaseAuth.instance;
    _showCalendarPicker() async {
      DateTimeRange? pickedRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2022),
        lastDate: DateTime(2025),
      );

      if (pickedRange != null) {
        // Filter transactions based on the selected date range
        filterTransactions(pickedRange.start, pickedRange.end);
      }
    }

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your Transactions",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: size.height * 0.3,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                        radius: 60,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      auth.currentUser!.displayName.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      auth.currentUser!.email.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Get.to(() => ProfileScreen());
              },
            ),
            ListTile(
              title: const Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: () async {
                await auth.signOut();
                Get.offAll(() => LoginScreen());
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _showCalendarPicker();
                },
                child: Container(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.filter_list),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                // Wrap with Obx widget to reactively update UI
                return Container(
                  alignment: Alignment.center,
                  child: chartController.recentTransactions.value.length == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: Get.height * 0.14),
                            Lottie.asset(
                                "Assets/Lottie/norecenttransactions.json"),
                            const Text("Add your first transaction to see here",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey)),
                          ],
                        )
                      : ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                chartController.filteredtransactions.length,
                            itemBuilder: (context, index) {
                              return HomeScreenTransactionTile(
                                reason: chartController
                                    .filteredtransactions[index]["reason"],
                                amount: chartController
                                    .filteredtransactions[index]["ammount"],
                                date:
                                    (chartController.filteredtransactions[index]
                                            ["dateTime"] as Timestamp)
                                        .toDate(),
                                paidOrRecived:
                                    chartController.filteredtransactions[index]
                                        ["paidOrRecived"],
                              );
                            },
                          ),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
