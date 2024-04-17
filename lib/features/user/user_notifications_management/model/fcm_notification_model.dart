// ignore_for_file: public_member_api_docs, sort_constructors_first

class FcmNotificationModel {
  final String userId;
  final String title;
  final String body;
  final FcmData data;

  //
  FcmNotificationModel({
    required this.userId,
    required this.title,
    required this.body,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "title": title,
      "body": body,
      "data": data.toJson(),
    };
  }

  factory FcmNotificationModel.fromJson(Map<String, dynamic> json) {
    return FcmNotificationModel(
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      data: FcmData.fromJson(json["data"]),
    );
  }
}

class FcmData {
  final String notificationType;
  final String? dop;
  final String? top;
  FcmData({
    required this.notificationType,
    this.dop,
    this.top,
  });

  Map<String, dynamic> toJson() {
    return {
      "notificationType": notificationType,
      "dop": dop,
      "top": top,
    };
  }

  factory FcmData.fromJson(Map<String, dynamic> json) {
    return FcmData(
      notificationType: json['notificationType'],
      dop: json['dop'],
      top: json['top'],
    );
  }
}
