import 'package:expenseapp/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class HomeScreenTransactionTile extends StatelessWidget {
  String reason;
  double amount;
  DateTime date;
  int paidOrRecived;
  HomeScreenTransactionTile(
      {super.key,
      required this.reason,
      required this.amount,
      required this.date,
      required this.paidOrRecived});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMEd().format(date);
    String time = DateFormat.jm()
        .format(DateFormat("hh:mm:ss").parse("${date.hour}:${date.minute}:00"));
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          decoration: const BoxDecoration(
              color: myBlue,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 60,
          width: 75,
          child: Lottie.asset("Assets/Lottie/$reason.json"),
        ),
        SizedBox(
          width: Get.width * 0.69,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reason,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      date.day == DateTime.now().day
                          ? "Today $time"
                          : date.day == DateTime.now().day - 1
                              ? "Tommrow $time"
                              : "$formattedDate $time",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Text(
                paidOrRecived == 0 ? "- ₹$amount" : "+ ₹$amount",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: paidOrRecived == 0 ? Colors.red : Colors.green),
              )
            ],
          ),
        )
      ]),
    );
  }
}
