import 'package:expenseapp/Screens/Home/home_screen.dart';
import 'package:expenseapp/Screens/Splash/splash_home.dart';
import 'package:expenseapp/Screens/Transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import '../Screens/Navigation/buttom_nav_bar.dart';

class GetAppPages {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: 'home',
      page: () => ShowCaseWidget(
        builder: Builder(
          builder: (context) => const HomeScreen(),
        ),
      ),
      transition: Transition.fade,
    ),
    GetPage(
      name: 'transaction',
      page: () => ShowCaseWidget(
        builder: Builder(
          builder: (context) => const TransactionDcreen(),
        ),
      ),
      transition: Transition.fade,
    ),
    GetPage(
      name: 'bottomnavigation',
      page: () => ShowCaseWidget(
        builder: Builder(
          builder: (context) => const Home(),
        ),
      ),
      transition: Transition.fade,
    ),
  ];
}
