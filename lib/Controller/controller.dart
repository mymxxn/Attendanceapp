import 'package:get/get.dart';

class Controller extends GetxController {
  
  var yess = false.obs;
  void checkiftrue() {
    yess.value = !yess.value;
    update();
  }
}
