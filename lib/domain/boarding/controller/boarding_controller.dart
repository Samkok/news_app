import 'package:demo/domain/home/models/user_model.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {

  RxInt selectedIndex = 0.obs;
  UserModel? loggedInUser;

  changeSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  setLoggedInUser(UserModel user) {
    loggedInUser = user;
    update();
  }

}