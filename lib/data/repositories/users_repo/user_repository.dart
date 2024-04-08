import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:petrecycler/data/repositories/autentication/authrepository.dart';
import 'package:petrecycler/features/autentication/model/user_model.dart';
import 'package:petrecycler/utilities/exceptions/custom_firebase_auth_exceptions.dart';
import 'package:petrecycler/utilities/exceptions/custom_firebase_exceptions.dart';
import 'package:petrecycler/utilities/exceptions/format_exceptions.dart';
import 'package:petrecycler/utilities/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  ///varibales
  final _db = FirebaseFirestore.instance;
  final authRepo = Get.put(AuthRepository());

  //create a user
  Future<void> createUser(UserModel user) async {
    try {
      await _db
          .collection('Users')
          .doc(authRepo.authUser!.uid)
          .set(user.toJson());
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

  //fetch a user
  Future<UserModel> getUser() async {
    try {
      final docSnapshot =
          await _db.collection('Users').doc(authRepo.authUser!.uid).get();

      if (docSnapshot.exists) {
        return UserModel.fromFirestoreDb(docSnapshot);
      } else {
        return UserModel.empty();
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

//fetch all users
  Future<List<UserModel>> getAllUsers() async {
    try {
      final querySnapshot = await _db.collection('Users').get();

      final docs = querySnapshot.docs;
      return docs.map((doc) => UserModel.fromFirestoreDb(doc)).toList();
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

  //udate user record
  Future<void> updateUserRecord(UserModel user) async {
    try {
      await _db
          .collection('Users')
          .doc(authRepo.authUser!.uid)
          .update(user.toJson());
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

  //update user specific fields
  Future<void> updateSpecificFields(Map<String, dynamic> json) async {
    try {
      await _db.collection('Users').doc(authRepo.authUser!.uid).update(json);
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

  //delete a user
  Future<void> deleteUser(UserModel user) async {
    try {
      await _db.collection('Users').doc(authRepo.authUser!.uid).delete();
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
