import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrecycler/features/admin/admin_dashboard/controllers/admin_barchart_controller.dart';

class CustomHomeRequestBarData extends StatelessWidget {
  const CustomHomeRequestBarData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminBarChartController());

    //
    return SizedBox(
      height: 280,
      child: BarChart(
        BarChartData(
          maxY: 100,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: controller.getBottomTiles,
              ),
            ),
          ),
          barGroups: controller.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.green,
                      width: 10,
                      borderRadius: BorderRadius.circular(3),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
