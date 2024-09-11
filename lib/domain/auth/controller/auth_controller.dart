import 'package:demo/domain/auth/pages/signin/sign_in.dart';
import 'package:demo/domain/boarding/pages/boarding_page.dart';
import 'package:get/get.dart';

import '../../home/models/user_model.dart';

class AuthController extends GetxController {
  var loggedInUser = Rxn<UserModel>();
  RxBool isLoggedIn = false.obs;
  
  // AuthController() {
  //   Get.log("AUTH CALLED");
  //   ever(isLoggedIn, handleAuthChange);
  // }
  //
  // void handleAuthChange(bool isLoggedIn) {
  //   if (!isLoggedIn) {
  //     Get.offAll(() => const SignInPage());
  //   } else {
  //     Get.offAll(() => const BoardingPage());
  //   }
  // }

  login() {
    Get.log("LOGIN");
    UserModel userModel = UserModel(id: 1, firstName: "Samkok", lastName: "Heng", email: "samkok@gmail.com", img: "assets/profile.png", cover: "assets/cover.png", articlesCount: 20, followers: 180, following: 90);
    loggedInUser.value = userModel;
    isLoggedIn.value = true;
    update();
    Get.offAllNamed("/boarding");
  }

  logout() {
    Get.log("LOGOUT");
    loggedInUser.value = null;
    isLoggedIn.value = false;
    update();
    Get.offAllNamed("/signIn");
  }

  void checkLoginState() {
    if (loggedInUser.value != null) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
    update();
    if (!isLoggedIn.value) {
      Get.offAll(() => const SignInPage());
    }
  }





}