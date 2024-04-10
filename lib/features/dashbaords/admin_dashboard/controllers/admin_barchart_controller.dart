import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/dashbaords/admin_dashboard/model/individual_bar_model.dart';
import 'package:petrecycler/utilities/constants/colors.dart';

class AdminBarChartController extends GetxController {
  static AdminBarChartController get instance => Get.find();

  ///variable
  List<double> monthlyRequests = [
    42.5,
    60.8,
    70.8,
    80.8,
    90.8,
    90.8,
    96.8,
    //make sure to provide the right numbers here as this handle the rod data
  ];

  List<IndividualBarModel> barData = [];
@override
  void onInit() {
    initilaizeData();
    super.onInit();
  }
//initilaize
  void initilaizeData() {
    barData = [
      IndividualBarModel(x: 10, y: monthlyRequests[0]),
      IndividualBarModel(x: 20, y: monthlyRequests[1]),
      IndividualBarModel(x: 30, y: monthlyRequests[2]),
      IndividualBarModel(x: 40, y: monthlyRequests[3]),
      IndividualBarModel(x: 50, y: monthlyRequests[4]),
      IndividualBarModel(x: 60, y: monthlyRequests[5]),
      IndividualBarModel(x: 70, y: monthlyRequests[6]),
    ];
  }

  Widget getBottomTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: CColors.dark,
      fontWeight: FontWeight.w200,
      fontSize: 12,
    );

    Widget text;
    switch (value.toInt()) {
      case 10:
        text = const Text(
          'Sun',
          style: style,
        );
        break;
      case 20:
        text = const Text(
          'Mon',
          style: style,
        );
        break;
      case 30:
        text = const Text(
          'Tue',
          style: style,
        );
        break;
      case 40:
        text = const Text(
          'Wed',
          style: style,
        );
        break;
      case 50:
        text = const Text(
          'Thu',
          style: style,
        );
        break;
      case 60:
        text = const Text(
          'Fri',
          style: style,
        );
        break;
      case 70:
        text = const Text(
          'Sat',
          style: style,
        );
        break;
      default:
        text = const Text(
          'T',
          style: style,
        );
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
