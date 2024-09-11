import 'dart:async';

import 'package:demo/domain/auth/services/auth_service.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  AuthService authService = AuthService();
  
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString email = "".obs;
  RxBool agreed = false.obs;

  RxBool isPwdCorrectFormat = false.obs;
  RxBool isPwdHasEnoughLength = false.obs;
  RxBool isPwdHasUpperCase = false.obs;
  RxBool isPwdHasNumber = false.obs;
  RxBool isPwdMatched = false.obs;
  RxBool isPwdEmpty = true.obs;
  RxBool isPasswordShown = false.obs;

  RxBool isEmailCorrectFormat = false.obs;

  Timer? timer;
  RxInt countDown = 60.obs;

  checkEmailFormat(String email) {
    isEmailCorrectFormat.value = authService.validateEmail(email);
    update();
  }

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDown > 0) {
        countDown.value--;
      } else {
        timer.cancel();
      }
      update();
    });
  }

  disposeTimer() {
    timer?.cancel();
    update();
  }

  togglePasswordShown() {
    isPasswordShown.value = !isPasswordShown.value;
    update();
  }

  checkInputPwd(String password) {
    isPwdHasEnoughLength = authService.enoughLength(password).obs;
    isPwdHasUpperCase = authService.pwdHasUpperCase(password).obs;
    isPwdHasNumber = authService.pwdHasNumber(password).obs;
    isPwdCorrectFormat.value = isPwdHasEnoughLength.value && isPwdHasUpperCase.value && isPwdHasNumber.value;
    update();
  }

  checkPasswordMatched({
    required String password,
    required String confirmPassword
  }) {
    isPwdMatched = (password == confirmPassword).obs;
    update();
  }

  resetPasswordPart() {
    isPwdCorrectFormat = false.obs;
    isPwdHasEnoughLength = false.obs;
    isPwdHasUpperCase = false.obs;
    isPwdHasNumber = false.obs;
    isPwdMatched = false.obs;
    update();
  }

  setSignUpInfo({
    required String firstName,
    required String lastName,
    required String email}) {

    this.firstName = firstName.obs;
    this.lastName = lastName.obs;
    this.email = email.obs;
    update();
  }

  setAgreed(bool agreed) {
    this.agreed = agreed.obs;
    update();
  }

}