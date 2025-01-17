import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyTarget extends StatefulWidget {
  const MonthlyTarget({super.key});

  @override
  State<MonthlyTarget> createState() => _MonthlyTargetState();
}

class _MonthlyTargetState extends State<MonthlyTarget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      width: 250,
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: 300,
              height: 300,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0, // Removes space between sections
                  centerSpaceRadius: 40, // The hole size in the center
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          // Legends Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              // Legend for Blue section (40%)
              LegendItem(color: Colors.blue, label: 'In Progress', value: "40"),
               SizedBox(width: 10),
              // Legend for Green section (30%)
              LegendItem(color: Colors.green, label: 'Completed', value: "30"),
               SizedBox(width: 10),
              // Legend for Red section (20%)
              LegendItem(color: Colors.red, label: 'Resolved', value: "20"),
               SizedBox(width: 10),
              // Legend for Orange section (10%)
              LegendItem(color: Colors.orange, label: 'Pending', value: "10"),
            ],
          ),
        ],
      ),
    );
  }
}

// This method returns the data for the sections of the donut chart
List<PieChartSectionData> showingSections() {
  return [
    PieChartSectionData(
      value: 40, // Value of the section (40%)
      color: Colors.blue,
      title: 'In Progress',
      radius: 100, // Outer radius of the section
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 30, // Value of the section (30%)
      color: Colors.green,
      title: 'Completed',
      radius: 100,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 20, // Value of the section (20%)
      color: Colors.red,
      title: 'Resolved',
      radius: 100,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 10, // Value of the section (10%)
      color: Colors.orange,
      title: 'Pending',
      radius: 100,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const LegendItem(
      {Key? key, required this.color, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 13),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
