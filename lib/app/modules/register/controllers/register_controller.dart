import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      isLoading.value = true;
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.updateDisplayName(username);
      Get.snackbar('Success', 'Registration successful');
      Get.offAllNamed('/login');
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email';
      }
      Get.snackbar('Error', message);
    } finally {
      isLoading.value = false;
    }
  }
}
