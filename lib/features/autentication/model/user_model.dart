// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

//
class UserModel {
  final String uid;
  final String? firstName;
  final String? companyName;
  final String? surName;
  final String? contactPersonName;
  final String email;
  final String phoneNumber;
  final String address;
  final String? lga;
  final String? rcn;
  final String userRole;
  String? profilePicture;

  //default constructor
  UserModel({
    required this.uid,
    this.firstName,
    this.companyName,
    this.surName,
    this.contactPersonName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.lga,
    this.rcn,
    required this.userRole,
    this.profilePicture,
  });

  //default constructor

  //admin

  factory UserModel.empty() => UserModel(
        uid: '',
        phoneNumber: '',
        address: '',
        email: '',
        userRole: 'none',
      );

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName ?? '',
      'companyName': companyName ?? '',
      'surName': surName ?? '',
      'contactPersonName': contactPersonName ?? '',
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'lga': lga ?? '',
      'rcn': rcn ?? '',
      'userRole': userRole,
      'profilePicture': profilePicture ?? ''
    };
  }

  //from firstore
  factory UserModel.fromFirestoreDb(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists && document.data() != null) {
      final data = document.data()!;
      return UserModel(
        uid: document.id,
        firstName: data['firstName'] ?? '',
        companyName: data['companyName'] ?? '',
        surName: data['surName'] ?? '',
        contactPersonName: data['contactPersonName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
        lga: data['lga'] ?? '',
        rcn: data['rcn'] ?? '',
        userRole: data['userRole'],
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
