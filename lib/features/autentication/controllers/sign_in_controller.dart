import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/data/repositories/users_repo/user_repository.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/features/autentication/views/sign_in/sign_in.dart';
import 'package:petrecycler/features/navigations/admin_navigation_menu.dart';
import 'package:petrecycler/features/navigations/user_navigation_menu.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/loaders/app_loader.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  ///variables
  final authRepo = AuthRepository.instance;
  final networkRepo = Get.put(NetWorkManager());
  final userRepo = Get.put(UserRepository());
  final RxBool rememberMe = false.obs;
  final RxBool showPassword = false.obs;
  late final TextEditingController email;
  late final TextEditingController password;
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  ///methods
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  //remember me changer
  void onRememberMeChanged(bool? value) {
    rememberMe.value = value!;
  }

  //
  void shouldShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void loginUser() async {
    try {
      //display a loader
      CApploader.showLoader(
        'Login in progress...',
        CImages.loader,
      );

      //check internet connectivity
      final result = await networkRepo.checkInternet();
      if (!result) {
        CApploader.stopLoader();
        return;
      }

      //check form details
      if (!signInFormKey.currentState!.validate()) {
        CApploader.stopLoader();
        return;
      }

      //sign in the user
      await authRepo.signInUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );


      //once logged in, fetch the user
      final user = await userRepo.getUser();

      //stop loading
      CApploader.stopLoader();

      //show success snack message
      CustomSnackBars.showSuccessSnackBar(
        "Congratulations",
        "${user.userType} logged in succefully",
      );

      //authorize based on roles
      if (user.userType == 'admin') {
        Get.offAll(() => const AdminNavigationMenu());
      } else if (user.userType == 'user') {
        Get.offAll(() => const UserNavigationMenu());
      }
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar("Oh Snap", e.toString());
    }
  }

  void logoutUser() async {
    try {
      await authRepo.signOutUser();
      Get.offAll(() => const SignInView());
    } catch (e) {
      CustomSnackBars.showErrorSnackBar("Oh Snap", e.toString());
    }
  }
}
