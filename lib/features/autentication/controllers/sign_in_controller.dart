import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/data/repositories/users_repo/user_repository.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/features/autentication/views/sign_up/sign_up_user.dart';
import 'package:petrecycler/features/autentication/views/sign_up/sign_up_recycler.dart';
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
  final RxBool showUser = false.obs;
  final RxBool showAdmin = false.obs;
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

  void onShowUser(bool? value) {
    if (!showAdmin.value) {
      showUser.value = value!;
    }
  }

  void onShowAdmin(bool? value) {
    if (!showUser.value) {
      showAdmin.value = value!;
    }
  }

  void continueUserRegistration() {
    if (showUser.value) {
      Get.to(() => const SignUpUserView());
    } else if (showAdmin.value) {
      Get.to(() => const SignUpRecyclerView());
    } else {
      CustomSnackBars.showInforSnackBar(
          title: 'Information', message: 'Please kindly tick as appropriate');
    }
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
        CImages.docerAnimation,
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
      final user = await userRepo.fetchUserRecord();

      //stop loading
      CApploader.stopLoader();

      //show success snack message
      CustomSnackBars.showSuccessSnackBar(
        title: "Congratulations",
        message: "${user.userRole} logged in succefully",
      );

      //

      //authorize based on roles
      if (user.userRole == 'admin') {
        Get.offAll(() => const AdminNavigationMenu());
      } else if (user.userRole == 'user') {
        Get.offAll(() => const UserNavigationMenu());
      }
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: "Oh Snap", message: e.toString());
    }
  }

  void logoutUser() async {
    try {
      await authRepo.signOutUser();
    } catch (e) {
      CustomSnackBars.showErrorSnackBar(
          title: "Oh Snap", message: e.toString());
    }
  }
}
