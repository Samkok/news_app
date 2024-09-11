import 'package:demo/domain/boarding/controller/boarding_controller.dart';
import 'package:get/get.dart';

class ArticleController extends BoardingController {

  RxBool isAudio = false.obs;

  toggleIsAudio(value) {
    isAudio.value = value;
    update();
  }

}