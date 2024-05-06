import 'package:expenseapp/Controller/authentication.dart';
import 'package:expenseapp/Screens/Splash/splash_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:motion/motion.dart';

import 'Themes/theme_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(Authentication()));
  await Motion.instance.initialize();
  await FirebaseMessaging.instance.subscribeToTopic('Reminder');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense App',
        theme: Themes.light,
        darkTheme: Themes.dark,
        home: const SplashScreen(),
      ),
    );
  }
}
