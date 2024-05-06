import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenseapp/Controller/ChartController/chart_controller.dart';
import 'package:expenseapp/Screens/Home/chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motion/motion.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChartController chartController = Get.put(ChartController());
    chartController.getTransactionList();
    final auth = FirebaseAuth.instance;
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 0.2),
              Color.fromRGBO(0, 0, 0, 0.2),
            ], // Replace with your desired gradient colors
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Motion.elevated(
          shadow: true,
          filterQuality: FilterQuality.high,
          elevation: 100,
          glare: true,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            decoration: const BoxDecoration(
              // boxShadow: [BoxShadow(blurRadius: 4)],
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.2),
                  Color.fromRGBO(0, 0, 0, 0.2),
                ], // Replace with your desired gradient colors
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: Get.height * 0.28,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Current Week",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Obx(
                      () => Text(
                        chartController.rebuildHome.value
                            ? "Total Transaction - ₹${chartController.totalAmountThisWeek}"
                            : "Total Transaction - ₹${chartController.totalAmountThisWeek}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const LinexChart(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mon"),
                    Text("Tue"),
                    Text("Wed"),
                    Text("Thu"),
                    Text("Fri"),
                    Text("Sat"),
                    Text("Sun"),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
