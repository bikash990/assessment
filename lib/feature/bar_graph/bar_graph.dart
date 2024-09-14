import 'package:agriculture_app/feature/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyGraphWidget extends StatelessWidget {
  final List weeklySummary;
  const MyGraphWidget({
    super.key,
    required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      janAmount: weeklySummary[0],
      AugAmount: weeklySummary[1],
      febAmount: weeklySummary[2],
      marchAmount: weeklySummary[3],
      sepAmount: weeklySummary[4],
    );
    barData.initializeData();
    return BarChart(
      BarChartData(
        backgroundColor: Colors.white,
        maxY: 200,
        minY: 0,
        barGroups: barData.barData
            .map((data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                        toY: data.y,
                        color: Colors.blue,
                        width: 25,
                        borderRadius: BorderRadius.circular(4)),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
