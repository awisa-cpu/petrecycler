import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/data/repositories/users_repo/user_repository.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/features/autentication/model/user_model.dart';
import 'package:petrecycler/features/autentication/views/sign_up/verify_email.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/loaders/app_loader.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variables

  final authRepo = AuthRepository.instance;
  final networkRepo = Get.put(NetWorkManager());
  final RxBool showPassword = false.obs;
  late TextEditingController firstName;
  late TextEditingController companyName;
  late TextEditingController surName;
  late TextEditingController contactPersonName;
  late TextEditingController email;
  late TextEditingController telephoneOrPhoneNo;
  late TextEditingController address;
  late TextEditingController lga;
  late TextEditingController rcn;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///methods
  @override
  void onInit() {
    super.onInit();
    firstName = TextEditingController();
    companyName = TextEditingController();
    surName = TextEditingController();
    contactPersonName = TextEditingController();
    email = TextEditingController();
    telephoneOrPhoneNo = TextEditingController();
    password = TextEditingController();
    address = TextEditingController();
    lga = TextEditingController();
    rcn = TextEditingController();
  }

  void shouldShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void signUpUser(String userType) async {
    try {
      //display a loader
      CApploader.showLoader(
        'Registrion in progress',
        CImages.docerAnimation,
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

      //save user in db
      await _createUserInDb(credential, userType);

      //stop the loader
      CApploader.stopLoader();

      //show success snack bar
      CustomSnackBars.showSuccessSnackBar(
        title: "Congratulations",
      message:   'registration successful',
      );

      //route to verify email screen
      Get.offAll(() => const VerifyEmailScreen());
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(title: "Oh Snap",message:  e.toString());
    }
  }

  Future<void> _createUserInDb(
      UserCredential credential, String userType) async {
    //use credential and form details to create a new firstore user
    final user = UserModel(
        uid: credential.user!.uid,
        firstName: userType == 'admin' ? '' : firstName.text.trim(),
        companyName: userType == 'admin' ? companyName.text.trim() : '',
        surName: userType == 'admin' ? '' : surName.text.trim(),
        contactPersonName:
            userType == 'admin' ? contactPersonName.text.trim() : '',
        email: email.text.trim(),
        phoneNumber: telephoneOrPhoneNo.text.trim(),
        address: address.text.trim(),
        lga: userType == 'admin' ? lga.text.trim() : '',
        rcn: userType == 'admin' ? rcn.text.trim() : '',
        userRole: userType.trim(),
        profilePicture: credential.user!.photoURL??'');

    //store in the firestore databse
    final userRepo = Get.put(UserRepository());
    await userRepo.createUser(user);
  }
}
