import 'package:demo/domain/auth/services/auth_service.dart';
import 'package:demo/domain/home/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  AuthService authService = AuthService();

  RxBool rememberMe = false.obs;
  RxBool isPasswordShown = false.obs;
  RxBool isEmailCorrectFormat = false.obs;

  UserModel? loggedInUser;

  setLoggedInUser(UserModel user) {
    Get.log(user.firstName);
    loggedInUser = user;
    update();
  }

  checkEmailFormat(String email) {
    isEmailCorrectFormat.value = authService.validateEmail(email);
    update();
  }

  togglePasswordShown() {
    isPasswordShown.value = !isPasswordShown.value;
    update();
  }

  toggleRememberMe(value) {
    rememberMe.value = value;
    update();
  }

}