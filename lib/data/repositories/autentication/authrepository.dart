import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petrecycler/features/autentication/views/onboarding/onboarding.dart';
import 'package:petrecycler/features/autentication/views/sign_in/sign_in.dart';
import 'package:petrecycler/features/autentication/views/sign_up/verify_email.dart';
import 'package:petrecycler/utilities/exceptions/custom_firebase_auth_exceptions.dart';
import 'package:petrecycler/utilities/exceptions/custom_firebase_exceptions.dart';
import 'package:petrecycler/utilities/exceptions/format_exceptions.dart';
import 'package:petrecycler/utilities/exceptions/platform_exceptions.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  final storageBucket = GetStorage();

  ///methods

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenDirect();
  }

  void screenDirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      //then check if email is verified
      if (user.emailVerified) {
        Get.offAll(() => const SignInView());
      } else {
        Get.off(() => const VerifyEmailScreen());
      }
    } else {
      //check if this is the first time of the user
      storageBucket.writeIfNull('isFirstTime', true);
      final value = storageBucket.read('isFirstTime');

      if (value) {
        //your first time
        Get.to(() => const OnboardingView());
      } else {
        Get.to(() => const SignInView());
      }
    }
  }

//method to get the current user in the application
  User? get authUser => FirebaseAuth.instance.currentUser;

  //method to create a user
  Future<UserCredential> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on CustomFirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on CustomFirebaseAuthExc catch (e) {
      throw CustomFirebaseAuthExc(code: e.code).message;
    } on CustomPlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } on CustomFormatException catch (_) {
      throw const CustomFormatException();
    }
  }

//method to verify email address
  Future<void> sendEmailVerification() async {
    try {
      _auth.currentUser?.sendEmailVerification();
    } on CustomFirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on CustomFirebaseAuthExc catch (e) {
      throw CustomFirebaseAuthExc(code: e.code).message;
    } on CustomPlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } on CustomFormatException catch (_) {
      throw const CustomFormatException();
    }
  }

  //method to sign in a user
  Future<UserCredential> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on CustomFirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on CustomFirebaseAuthExc catch (e) {
      throw CustomFirebaseAuthExc(code: e.code).message;
    } on CustomPlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } on CustomFormatException catch (_) {
      throw const CustomFormatException();
    } on SocketException catch (e) {
      throw "Error connecting to the network ${e.message}";
    } on TimeoutException catch (e) {
      throw 'Request timed out ${e.message}';
    }
  }

  //method to sign out the user
  Future<void> signOutUser() async {
    try {
      if (authUser != null) {
        await _auth.signOut();
        Get.offAll(() => const SignInView());
      }
    } on CustomFirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on CustomFirebaseAuthExc catch (e) {
      throw CustomFirebaseAuthExc(code: e.code).message;
    } on CustomPlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } on CustomFormatException catch (_) {
      throw const CustomFormatException();
    }
  }

//method to reset password
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on CustomFirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on CustomFirebaseAuthExc catch (e) {
      throw CustomFirebaseAuthExc(code: e.code).message;
    } on CustomPlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } on CustomFormatException catch (_) {
      throw const CustomFormatException();
    }
  }

//sign in with google provider
  Future<UserCredential> signInWithGoogle({
    required String email,
    required String password,
  }) async {
    try {
      //starts the auth flow
      final userGoogleSignInAccount = await GoogleSignIn().signIn();

      //fetch the signin authentication for this user account
      final signInAuthentication =
          await userGoogleSignInAccount?.authentication;

      //create an authcredential with the users auth details
      final authCredential = GoogleAuthProvider.credential(
          accessToken: signInAuthentication?.accessToken,
          idToken: signInAuthentication?.idToken);

      //autheticate with the created credential
      return _auth.signInWithCredential(authCredential);
    } on CustomFirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on CustomFirebaseAuthExc catch (e) {
      throw CustomFirebaseAuthExc(code: e.code).message;
    } on CustomPlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } on CustomFormatException catch (_) {
      throw const CustomFormatException();
    }
  }
}
