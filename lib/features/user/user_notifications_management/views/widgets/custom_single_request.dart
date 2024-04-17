import 'package:flutter/material.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';

class CustomSingleRequest extends StatelessWidget {
  const CustomSingleRequest({
    super.key,
    required this.request,
  });

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: false,
      onLongPress: () {},
      onTap: () {},
      title: Text(request.address),
      subtitle: Text(request.createdAt),
      trailing: Text(
        request.bottleQuantity,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      isThreeLine: true,
    );
  }
}
