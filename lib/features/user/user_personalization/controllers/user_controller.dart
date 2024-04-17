import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/data/repositories/users_repo/user_repository.dart';
import 'package:petrecycler/data/services/network_service/network_manager.dart';
import 'package:petrecycler/features/autentication/model/user_model.dart';
import 'package:petrecycler/features/autentication/views/sign_in/sign_in.dart';
import 'package:petrecycler/features/user/user_personalization/views/user_settings/re_authenticate_user_login_form.dart';
import 'package:petrecycler/utilities/constants/images_texts.dart';
import 'package:petrecycler/utilities/constants/sizes.dart';
import 'package:petrecycler/utilities/loaders/app_loader.dart';
import 'package:petrecycler/utilities/snackbars/custom_snackbars.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

//variables
  final userRespository = Get.put(UserRepository());
  Rx<bool> imageUploading = false.obs;
  Rx<bool> isProfileNameLoading = false.obs;
  Rx<bool> isFetchingAdmin = false.obs;
  Rx<bool> hidePassword = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  Rx<UserModel> admin = UserModel.empty().obs;
  final verifyEmailCon = TextEditingController();
  final verifyPasswordCon = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final currentUserFromLocal = GetStorage().read('currentUser');

  //
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
    getAdmin();
  }

  Future<void> getAdmin() async {
    try {
      isFetchingAdmin.value = true;

      final admin = await userRespository.getFirstAdmin();
      this.admin.value = admin;
    } catch (e) {
      admin(UserModel.empty());
    } finally {
      isFetchingAdmin.value = false;
    }
  }

  ///fetch user record from the firestore database
  Future<void> fetchUserRecord() async {
    try {
      isProfileNameLoading.value = true;
      final user = await userRespository.fetchUserRecord();
      this.user.value = user;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      isProfileNameLoading.value = false;
    }
  }

  ///save user record from any registration provider
  /*
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord(); //first update the Rx user and then check if user data is already stored. if not store new data.
      if (user.value.id.isEmpty) {
        //if no record already stored
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user?.displayName ?? '');
          final userName = UserModel.generateUserName(
              userCredential.user?.displayName ?? '');

          //map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
            userName: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          //save data to the firestore database
          await UserRepository.instance.saveUserRecord(user);
        }
      }
    } catch (e) {
      CustomSnackbars.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }
*/
//delete accout popups
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(CSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: CSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        ));
  }

  ///function to delete user accout from firebaseFirestore
  deleteUserAccount() async {
    try {
      //start loader
      CApploader.showLoader('Processing...', CImages.docerAnimation);

      //first re-authenticate user
      final auth = AuthRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          CApploader.stopLoader();
          Get.offAll(() => const SignInView());
        } else if (provider == 'password') {
          CApploader.stopLoader();
          Get.to(() => const ReAuthenticateLoginForm());
        }
      }
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showInforSnackBar(
          title: 'Oh Snap!', message: e.toString());
    }
  }

  ///Reauthenticate user before deleting
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      //start loader
      CApploader.showLoader('Processing...', CImages.docerAnimation);

      //check interner
      final isConnected = await NetWorkManager.instance.checkInternet();
      if (!isConnected) {
        CApploader.stopLoader();
        return;
      }

      //check form state if valid
      if (reAuthFormKey.currentState != null) {
        if (!reAuthFormKey.currentState!.validate()) {}
        CApploader.stopLoader();
        return;
      }

      //re-authenticate the user with email and password
      await AuthRepository.instance.reAuthenticateWithEmailAndPassword(
        email: verifyEmailCon.text.trim(),
        password: verifyPasswordCon.text.trim(),
      );
      await AuthRepository.instance.deleteAccount();

      //stop the loader
      CApploader.stopLoader();

      //navigate to login
      Get.offAll(() => const SignInView());
    } catch (e) {
      CApploader.stopLoader();
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh Snap!', message: e.toString());
    }
  }

  ///method to upload user profile
  void uploadUserProfilePicture() async {
    try {
      //instantiate an instance of image picker
      final imagePicker = ImagePicker();
      //get the image from gallery
      final image = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        //upload image
        imageUploading.value = true;
        final imageUrl = await userRespository.uploadUserImage(
            path: 'Users/Images/Profile', image: image);
        //update the user details
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRespository.updateSpecificFields(json);

        //
        user.value.profilePicture = imageUrl;
        user.refresh();
        CustomSnackBars.showSuccessSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      Logger().i('message', error: e);
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong');
    } finally {
      imageUploading.value = false;
    }
  }
}
