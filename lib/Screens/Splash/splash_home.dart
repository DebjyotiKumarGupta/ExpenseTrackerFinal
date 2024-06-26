import 'dart:async';

import 'package:expenseapp/Controller/ChartController/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 300), () {});
  }

  @override
  Widget build(BuildContext context) {
    ChartController chartController = Get.put(ChartController());
    // chartController.getTransactionList();
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.blue.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset("Assets/Lottie/splash.json",
                  height: 250, width: 300, fit: BoxFit.fill, repeat: false),
            ),
            SizedBox(
              height: Get.height * 0.25,
            ),
            const Text(
              "EXPENSE TRACKER APP",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
