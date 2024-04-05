import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  ///variables
  final RxBool showPassword = false.obs;
  final RxBool showConfirmPassword = false.obs;

  ///methods
  void shouldShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void shouldShowConfirmPassword() {
    showConfirmPassword.value = !showConfirmPassword.value;
  }
}
