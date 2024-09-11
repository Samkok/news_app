import 'package:demo/domain/settings/model/language_model.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {

  Rxn<LanguageModel>? selectedLanguage;

  setLanguage(LanguageModel language) {
    selectedLanguage = Rxn(language);
    update();
  }

}