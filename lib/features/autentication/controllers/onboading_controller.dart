import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petrecycler/features/autentication/views/sign_in/sign_in.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instnce => Get.find();

  ///variables
  final storageBucket = GetStorage();



  ///methods
void toLogin(){
  storageBucket.write('isFirstTime', false);
  Get.off(()=>const SignInView());
}  
}