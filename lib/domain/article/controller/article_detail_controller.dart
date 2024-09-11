import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArticleDetailController extends GetxController {
  RxBool isOpen = false.obs;
  late Rxn<OverlayEntry> overlayEntry;

  moreButtonClick(BuildContext context, OverlayEntry ove) {
    isOpen.value = !isOpen.value;
    if (isOpen.value) {
      overlayEntry = Rxn(ove);
      Overlay.of(context).insert(ove);
    } else {
      overlayEntry.value?.remove();
    }
    update();
  }

  closeOverlay() {
    if (isOpen.value) overlayEntry.value?.remove();
    isOpen.value = false;
    update();
  }
}