import 'package:get/get.dart';

class AccountInfoController extends GetxController {
  static AccountInfoController get instance => Get.find();

  //variables
  final RxBool togglePassword = false.obs;

  //methods

  void passwordToggler() {
    togglePassword.value = !togglePassword.value;
  }
}
