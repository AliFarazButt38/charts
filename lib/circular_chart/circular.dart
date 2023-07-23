import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class CircularChart extends StatefulWidget {
  const CircularChart({Key? key}) : super(key: key);

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _toolTipBehaviour;


  @override

  void initState(){
    _chartData=getChartData();
    _toolTipBehaviour=TooltipBehavior(enable: true);
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(

          title: ChartTitle(text: 'GDP Growth of different continents'),
          legend: Legend(isVisible:true,overflowMode: LegendItemOverflowMode.wrap),
         tooltipBehavior: _toolTipBehaviour,
         series: <CircularSeries>[
           // PieSeries();
           // DoughnutSeries();
           RadialBarSeries<GDPData,String>(

             dataSource: _chartData,
             xValueMapper: (GDPData data,_)=>data.continent,
             yValueMapper: (GDPData data,_)=>data.gdp,
             dataLabelSettings: DataLabelSettings(
                 isVisible: true,
               // labelPosition: ChartDataLabelPosition.inside,
               // labelAlignment: ChartDataLabelAlignment.middle,
               // labelIntersectAction: LabelIntersectAction.shift,

             ),
             enableTooltip: true,
             maximumValue: 10,
             cornerStyle: CornerStyle.bothCurve,

           // radius:'50',
           ),
         ],

          // palette: [
          //   Colors.greenAccent,
          //   Colors.blueAccent,
          //   Colors.redAccent,
          //   Colors.yellowAccent,
          //   Colors.deepPurpleAccent,
          // ],

        ),
      ),
    );
  }
  List <GDPData> getChartData(){
    final List<GDPData> ChartData=[
      GDPData('Africa', 1),
      GDPData('Asia', 2),
      GDPData('S America', 3),
      GDPData('Ociana', 5),
      GDPData('N America', 6),
      GDPData('Europe', 7),
    ];
    return ChartData;
  }
}

class GDPData{
  GDPData(this.continent, this.gdp);
  final int gdp;
  final String continent;
}