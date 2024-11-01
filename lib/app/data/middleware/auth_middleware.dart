import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_2/app/data/service/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();

    if (!authService.isLoggedIn() && route != '/login') {
      return const RouteSettings(name: '/login');
    }

    if (authService.isLoggedIn() && route == '/login') {
      return const RouteSettings(name: '/home');
    }

    return null;
  }
}
