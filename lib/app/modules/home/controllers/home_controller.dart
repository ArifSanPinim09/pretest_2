import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pretest_2/app/data/model/moment_model.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<MomentModel> moments = <MomentModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMoments();
  }

  Future<void> getMoments() async {
    try {
      isLoading.value = true;
      final querySnapshot = await _firestore
          .collection('moments')
          .orderBy('createdAt', descending: true)
          .get();

      moments.value = querySnapshot.docs
          .map((doc) => MomentModel.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load moments: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  String? get currentUsername => _auth.currentUser?.displayName;

  Future<void> addMoment(String title, String content) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final moment = MomentModel(
        id: '',
        userId: user.uid,
        username: user.displayName ?? 'Anonymous',
        title: title,
        content: content,
        createdAt: DateTime.now(),
      );

      await _firestore.collection('moments').add(moment.toFirestore());
      await getMoments();
      Get.back();
      Get.snackbar('Success', 'Moment added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add moment: ${e.toString()}');
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}
