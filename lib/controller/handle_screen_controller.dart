import 'package:get/get.dart';

class HandleScreenController extends GetxController {
  bool isTapped = false;
  bool isTapped1 = false;
  bool isTapped2 = false;
  bool isTapped3 = false;

  int screenSelected = 0;
  int screenSelected1 = 0;

  void changeScreen(int value) {
    screenSelected = value;
    update();
  }

  void changeScreen1(int value) {
    screenSelected = value;
    update();
  }

  void changeTapped(bool value) {
    isTapped = value;
    update();
  }

  void changeTapped1(bool value) {
    isTapped1 = value;
    update();
  }

  void changeTapped2(bool value) {
    isTapped2 = value;
    update();
  }

  void changeTapped3(bool value) {
    isTapped3 = value;
    update();
  }
}
