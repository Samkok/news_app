import 'package:demo/domain/settings/model/country_code_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  RxBool isOpen = false.obs;
  late Rxn<OverlayEntry> overlayEntry;
  Rxn<CountryCodeModel> selectedCode = Rxn(null);

  buttonClick(BuildContext context, OverlayEntry ove) {
    isOpen.value = !isOpen.value;
    if (isOpen.value) {
      overlayEntry = Rxn(ove);
      Overlay.of(context).insert(ove);
    } else {
      overlayEntry.value?.remove();
    }
    update();
  }

  selectCode(CountryCodeModel code) {
    selectedCode = Rxn(code);
    isOpen.value = false;
    overlayEntry.value?.remove();
    update();
  }

  closeOverlay() {
    if (isOpen.value) overlayEntry.value?.remove();
    isOpen.value = false;
    update();
  }

}