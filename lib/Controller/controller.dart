import 'package:get/get.dart';

class Controller extends GetxController {
  var isitobscure = false.obs;
  var yess = false.obs;
  void checkiftrue() {
    yess.value = !yess.value;
    update();
  }

  void checkifobscure() {
    isitobscure.value = !isitobscure.value;
    update();
  }
}
