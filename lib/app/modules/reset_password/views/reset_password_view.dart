import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_2/app/modules/widget/button_widget.dart';
import 'package:pretest_2/app/modules/widget/text_formfield_widget.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
                "Reset",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Forgot your password?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const Text(
                "Please create your new password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 100.0),
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
              const SizedBox(height: 100.0),
              Obx(() => ButtonWidget(
                    title:
                        controller.isLoading.value ? "Loading..." : "Confirm",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.resetPassword(_emailController.text);
                      }
                    },
                  )),
              const SizedBox(height: 150.0),
              Center(
                child: TextButton(
                  onPressed: () => Get.toNamed('/register'),
                  child: const Text(
                    'Don\'t have an account? Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
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
