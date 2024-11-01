import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();

    user.bindStream(_auth.authStateChanges());
  }

  bool isLoggedIn() {
    return user.value != null;
  }
}
