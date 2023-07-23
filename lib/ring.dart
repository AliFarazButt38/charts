import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RingChart extends StatelessWidget {
  final Map<String, double> dataMap = {
    "Watch Videos": 10.0,
    "Social Media": 20.0,
    "Surveys": 15.0,
    "Invite Friends": 5.0,
    "Others": 10.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PieChart(
          PieChartData(
            sections: getSections(),
            centerSpaceRadius: 100,
            sectionsSpace: 0,
          ),

        ),
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    List<PieChartSectionData> sections = [];
    int index = 0;
    dataMap.forEach((title, value) {
      final color = getColor(index);
      final section = PieChartSectionData(
        value: value,
        title: '$value%',
        color: color,
        radius: 100,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
      sections.add(section);
      index++;
    });
    return sections;
  }

  Color getColor(int index) {
    List<Color> colors = [
      Colors.deepPurpleAccent,
      Colors.blueAccent,
      Colors.pinkAccent,
      Colors.greenAccent,
      Colors.amberAccent,
    ];
    return colors[index % colors.length];
  }
}
