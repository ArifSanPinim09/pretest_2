import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 142, 178),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book,
            size: 100.0,
            color: Colors.white,
          ),
          SizedBox(height: 5.0),
          Text(
            "Koleksiku",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Text(
            "Punyaku",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      )),
    );
  }
}
