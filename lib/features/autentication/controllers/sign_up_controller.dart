import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/data/repositories/users_repo/user_repository.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/features/autentication/model/auth_user_model.dart';
import 'package:petrecycler/features/autentication/views/sign_in/sign_in.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/loaders/app_loader.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variables
  final userRepo = UserRepository.instance;
  final authRepo = AuthRepository.instance;
  final networkRepo = Get.put(NetWorkManager());
  final RxBool showPassword = false.obs;
  final RxString? userType = 'admin'.obs;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///methods

  @override
  void onInit() {
    super.onInit();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
  }

  void shouldShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void selectUserType(String? value) {
    userType?.value = value!;
  }

  void signUpAndCreateUser() async {
    try {
      //display a loader
      CApploader.showLoader(
        'Registrion in progress',
        CImages.loader,
      );

      //check internet connectivity
      final result = await networkRepo.checkInternet();
      if (!result) {
        CApploader.stopLoader();
        return;
      }

      //check form details
      if (!formKey.currentState!.validate()) {
        CApploader.stopLoader();
        return;
      }

      //sign up the user
      final credential = await authRepo.registerUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      //use credential and form details to create a new firstore user
      final user = AuthUserModel(
        uid: credential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phoneNumber: phoneNumber.text,
        userType: userType!.value,
      );

      //store in the firestore databse
      await userRepo.createUser(user);

      //stop the loader
      CApploader.stopLoader();

      //show success snack bar
      CustomSnackBars.showSuccessSnackBar(
        "Congratulations",
        'registration successful',
      );

      //route to verify email screen
      Get.off(() => const SignInView());
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar("Oh Snap", e.toString());
    }
  }


}
