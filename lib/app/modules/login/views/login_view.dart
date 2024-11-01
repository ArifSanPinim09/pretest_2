import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretest_2/app/modules/widget/button_widget.dart';
import 'package:pretest_2/app/modules/widget/text_formfield_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 142, 178),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Welcome back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const Text(
                "Please login to your account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 50.0),
              TextFormfieldWidget(
                controller: _emailController,
                hintText: "Email",
                isPassword: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormfieldWidget(
                controller: _passwordController,
                hintText: "Password",
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
              Obx(
                () => ButtonWidget(
                  isLoading: controller.isLoading.value,
                  title: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    }
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot the password?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 200.0),
              TextButton(
                onPressed: () => Get.toNamed('/register'),
                child: const Text(
                  'Don' 't have an account? Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
