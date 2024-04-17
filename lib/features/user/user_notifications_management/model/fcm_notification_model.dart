import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class FcmNotificationModel {
  final String userId;
  final String title;
  final String body;
  final FcmData data;

  FcmNotificationModel({
    required this.userId,
    required this.title,
    required this.body,
    required this.data,
  });

  FcmNotificationModel copyWith({
    String? userId,
    String? title,
    String? body,
    FcmData? data,
  }) {
    return FcmNotificationModel(
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'title': title});
    result.addAll({'body': body});
    result.addAll({'data': data.toMap()});

    return result;
  }

  factory FcmNotificationModel.fromMap(Map<String, dynamic> map) {
    return FcmNotificationModel(
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      data: FcmData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FcmNotificationModel.fromJson(String source) =>
      FcmNotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FcmNotificationModel(userId: $userId, title: $title, body: $body, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FcmNotificationModel &&
        other.userId == userId &&
        other.title == title &&
        other.body == body &&
        other.data == data;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ title.hashCode ^ body.hashCode ^ data.hashCode;
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

  FcmData copyWith({
    String? notificationType,
    String? dop,
    String? top,
  }) {
    return FcmData(
      notificationType: notificationType ?? this.notificationType,
      dop: dop ?? this.dop,
      top: top ?? this.top,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'notificationType': notificationType});
    if (dop != null) {
      result.addAll({'dop': dop});
    }
    if (top != null) {
      result.addAll({'top': top});
    }

    return result;
  }

  factory FcmData.fromMap(Map<String, dynamic> map) {
    return FcmData(
      notificationType: map['notificationType'] ?? '',
      dop: map['dop'],
      top: map['top'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FcmData.fromJson(String source) =>
      FcmData.fromMap(json.decode(source));

  @override
  String toString() =>
      'FcmData(notificationType: $notificationType, dop: $dop, top: $top)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FcmData &&
        other.notificationType == notificationType &&
        other.dop == dop &&
        other.top == top;
  }

  @override
  int get hashCode => notificationType.hashCode ^ dop.hashCode ^ top.hashCode;
}
