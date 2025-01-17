import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class ProjectStatics extends StatefulWidget {
  const ProjectStatics({super.key});

  @override
  State<ProjectStatics> createState() => _ProjectStaticsState();
}

class _ProjectStaticsState extends State<ProjectStatics> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100, // Set the maximum value for the Y-axis
              barTouchData: BarTouchData(enabled: false),
              borderData: FlBorderData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 22),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
              ),
              barGroups: [
                BarChartGroupData(x: 0, barRods: [
                  BarChartRodData(
                      toY: 80,
                      color: Colors.blue,
                      width: 20,
                      borderRadius: BorderRadius.zero), // India Score
                  BarChartRodData(
                      toY: 75,
                      color: Colors.green,
                      width: 20,
                      borderRadius: BorderRadius.zero), // Pakistan Score
                ]),
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                      toY: 90,
                      color: Colors.blue,
                      width: 20,
                      borderRadius: BorderRadius.zero), // India Score
                  BarChartRodData(
                      toY: 60,
                      color: Colors.green,
                      width: 20,
                      borderRadius: BorderRadius.zero), // Pakistan Score
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(
                      toY: 70,
                      color: Colors.blue,
                      width: 20,
                      borderRadius: BorderRadius.zero), // India Score
                  BarChartRodData(
                      toY: 80,
                      color: Colors.green,
                      width: 20,
                      borderRadius: BorderRadius.zero), // Pakistan Score
                ]),
                // Add more data points for different years
              ] // Show border

              ),
        ));
  }
}
