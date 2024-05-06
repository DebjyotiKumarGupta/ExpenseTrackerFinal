import 'package:expenseapp/Screens/Navigation/buttom_navigation.dart';
import 'package:expenseapp/widgets/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey showcaseKey1 = GlobalKey();
  GlobalKey showcaseKey2 = GlobalKey();
  GlobalKey showcaseKey3 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SharedPreferences showcasePreferences;

    displayShowcase() async {
      showcasePreferences = await SharedPreferences.getInstance();
      bool? showcaseVisibiltyStatus =
          showcasePreferences.getBool("showShowcasehome");
      if (showcaseVisibiltyStatus == null) {
        showcasePreferences
            .setBool("showShowcasehome", false)
            .then((bool success) {
          if (success)
            print("Showcase started");
          else
            print("Problem with showcase");
        });
        return true;
      }
      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context).startShowCase([
          showcaseKey1,
          showcaseKey2,
          showcaseKey3,
        ]);
      }
    });
    Size size = MediaQuery.of(context).size;
    ButtomNavigationController navcontroller = ButtomNavigationController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Obx(
          () => navcontroller.pageList[navcontroller.pageIndex.value],
        ),
        Positioned(
            bottom: size.height * 0.02,
            left: size.width * 0.05,
            child: Container(
              height: 50,
              width: size.width * 0.9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                height: 70,
                width: Get.width,
                child: Stack(children: [
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Showcase(
                            key: showcaseKey1,
                            title: "Home Screen",
                            targetBorderRadius: BorderRadius.circular(30),
                            description:
                                "This is the home screen. You can see your transactions here.",
                            child: IconButton(
                                onPressed: () {
                                  navcontroller.pageIndex.value = 0;
                                },
                                icon: Icon(
                                  Icons.home_filled,
                                  color: navcontroller.pageIndex.value == 0
                                      ? Colors.purple
                                      : Colors.blue,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (builder) {
                                  return const AddTransactionAlert();
                                },
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Showcase(
                            key: showcaseKey3,
                            title: "Graph Screen & History",
                            description:
                                "You can see your transaction history and graph here.",
                            targetBorderRadius: BorderRadius.circular(30),
                            child: IconButton(
                                onPressed: () {
                                  navcontroller.pageIndex.value = 1;
                                },
                                icon: Icon(
                                  Icons.swap_horizontal_circle,
                                  color: navcontroller.pageIndex.value == 1
                                      ? Colors.purple
                                      : Colors.blue,
                                )),
                          ),
                        ],
                      )),
                  Center(
                    heightFactor: 0.05,
                    child: SizedBox(
                      height: Get.width * 0.13,
                      width: Get.width * 0.13,
                      child: FloatingActionButton(
                          backgroundColor: Colors.cyan,
                          shape: const CircleBorder(),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (builder) {
                                return const AddTransactionAlert();
                              },
                            );
                          },
                          child: Showcase(
                            key: showcaseKey2,
                            title: "Add Transaction",
                            targetBorderRadius: BorderRadius.circular(30),
                            description:
                                "You can add a new transaction by clicking this button.",
                            child:
                                Lottie.asset("Assets/Lottie/add_button.json"),
                          )),
                    ),
                  ),
                ]),
              ),
            )),
      ]),
    );
  }
}
