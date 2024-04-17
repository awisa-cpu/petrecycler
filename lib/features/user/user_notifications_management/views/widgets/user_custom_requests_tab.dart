import 'package:flutter/material.dart';
import 'package:petrecycler/features/user/user_notifications_management/model/request_model.dart';
import 'package:petrecycler/features/user/user_notifications_management/views/widgets/custom_single_request.dart';

class UserCustomRequestsTab extends StatelessWidget {
  const UserCustomRequestsTab({
    super.key,
    required this.requests,
  });

  final List<RequestModel> requests;

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: requests.length,
        itemBuilder: (_, index) {
          final singleRequest = requests[index];
          return CustomSingleRequest(
            request: singleRequest,
          );
        },
      ),
    );
  }
}
