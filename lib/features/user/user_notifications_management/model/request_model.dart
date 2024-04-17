// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

/*
userId(that sends the message)
id
senderToken
ReceiverToken/UserId
status
isRead
title
message
datetime
address
quanity
phoneNumber

*send messages to the UserMessages collection
*user sends requests to the admin using the adminId which is used to fetch the device token of the admin (we need to know the admin uid)
*admin receives notifications and sends a reply to the user using the userid which fetches the user device token from the database

*/

class RequestModel {
  final String? uid;
  final String senderId;
  final String status; //pending, accepted,declined, completed
  final String createdAt;
  final String updatedAt;
  final String bottleQuantity;
  final String address;
  final String phoneNumber;
   bool readStatus;
 String? title;
  String? body;
  RequestModel({
  this.uid,
    required this.senderId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.bottleQuantity,
    required this.address,
    required this.phoneNumber,
    this.title,
    this.body,
    this.readStatus = false,
  });

  //

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'bottleQuantity': bottleQuantity,
      'address': address,
      'phoneNumber': phoneNumber,
      'title':title??'',
      'body':body??'',
      'readStatus':readStatus

    };
  }

  factory RequestModel.fromDBSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null && snapshot.exists) {
      final data = snapshot.data()!;
      return RequestModel(
        uid: snapshot.id,
        senderId: data['senderId'],
        status: data['status'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
        bottleQuantity: data['bottleQuantity'],
        address: data['address'],
        phoneNumber: data['phoneNumber'],
        title: data['title']??"",
        body: data['body']??"",
        readStatus: data['readStatus']??false
      );
    } else {
      return RequestModel(
          uid: '',
          senderId: '',
          status: '',
          createdAt: '',
          updatedAt: '',
          bottleQuantity: '',
          address: '',
          phoneNumber: '');
    }
  }
}
