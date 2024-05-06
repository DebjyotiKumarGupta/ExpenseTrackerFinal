import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Profile Screen", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
