import 'package:flutter/material.dart';
import 'package:graphs/barGraph/barGraph.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<double> weeklySummry=[
    20,
    30,
    40,
    50,
    60,
    70,
    80,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SizedBox(
            height: 300,
            child: MyBarGraph(
              weeklySummry: weeklySummry,
            )),
      ),
    );
  }
}
