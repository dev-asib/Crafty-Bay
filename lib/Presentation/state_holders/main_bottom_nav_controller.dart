import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void selectCategory() {
    changeIndex(1);
  }

  void backToHome() {
    changeIndex(0);
  }
}
