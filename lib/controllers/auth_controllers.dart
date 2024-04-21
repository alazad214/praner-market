import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:praner_market/auth/profile_setup.dart';
import '../screens/bottomnav_screen.dart';

class Auth_Controller extends GetxController {
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");
  RxString name = RxString("");
  RxString address = RxString("");
  RxString phone = RxString("");

  RxBool isloading = RxBool(false);

  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;

  SignUp() async {
    if (password.value != confirmpassword.value) {
      Get.snackbar("Invalid password", "Password doesn't matched");
      return;
    }
    isloading.value = true;
    update();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          isloading.value = false;
          update();
          Get.offAll(Profile_setup());
        }
      });
    } on FirebaseAuthException catch (error) {
      isloading.value = false;
      update();

      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  Log_In() async {
    isloading.value = true;
    update();
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          isloading.value = false;
          update();
          Get.offAll(BottomNav_Screen());
          Get.snackbar("Seccess", "Login Successfully");
        }
      });
    } on FirebaseAuthException catch (error) {
      isloading.value = false;
      update();
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  profileSetUp() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(email.value)
        .collection("user")
        .add({
      'email': email.value,
      'full_name': name.value,
      'address': address.value,
      'phone_number': phone.value,
    });
    Get.offAll(() => BottomNav_Screen());
  }
}
