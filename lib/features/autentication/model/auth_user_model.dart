// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class AuthUserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String userType;
  final String? profilePicture;

  //default constructor
  AuthUserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    required this.userType,
    this.profilePicture,
  });

  factory AuthUserModel.empty() => AuthUserModel(
        uid: '',
        firstName: '',
        lastName: '',
        email: '',
        userType: 'none',
      );

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber ?? '',
      'userType': userType,
      'profilePicture': profilePicture ?? ''
    };
  }

  //from firstore
  factory AuthUserModel.fromFirestoreDb(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists && document.data() != null) {
      final data = document.data()!;
      return AuthUserModel(
        uid: document.id,
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        userType: data['userType'],
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return AuthUserModel.empty();
    }
  }
}
