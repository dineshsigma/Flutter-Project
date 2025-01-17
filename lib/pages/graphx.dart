// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class PieChartExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pie Chart Example'),
//       ),
//       body: Center(
//         child: SizedBox(
//           width: 300, // Provide width for the chart
//           height: 300, // Provide height for the chart
//           child: PieChart(
//             PieChartData(
//               sections: [
//                 PieChartSectionData(
//                   value: 40,
//                   color: Colors.red,
//                   title: '40%',
//                   radius: 50, // Radius for this section
//                 ),
//                 PieChartSectionData(
//                   value: 30,
//                   color: Colors.blue,
//                   title: '30%',
//                   radius: 50,
//                 ),
//                 PieChartSectionData(
//                   value: 20,
//                   color: Colors.green,
//                   title: '20%',
//                   radius: 50,
//                 ),
//                 PieChartSectionData(
//                   value: 10,
//                   color: Colors.orange,
//                   title: '10%',
//                   radius: 50,
//                 ),
//               ],
//               centerSpaceRadius: 50, // Empty center space
//               sectionsSpace: 2, // Space between sections
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: PieChartExample()));
// }




//////------------------------------------------------- Bar Graphs ------------------------------------/////
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 3, color: Colors.blue,width: 55,borderRadius: BorderRadius.zero)]),
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 8, color: Colors.red,width: 20)]),
              BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 2, color: Colors.green,width: 20)]),
            ],
          ),
        ),
      ),
    );
  }
}



