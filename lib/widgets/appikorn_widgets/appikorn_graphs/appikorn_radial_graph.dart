import '../../../../export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class appikorn_radial_graph extends StatelessWidget {
  const appikorn_radial_graph({Key? key}) : super(key: key);

  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
          maximumValue: 15,
          dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'John', y: 10, text: '100%', pointColor: const Color.fromRGBO(248, 177, 149, 1.0)),
            ChartSampleData(x: 'Almaida', y: 11, text: '100%', pointColor: const Color.fromRGBO(246, 114, 128, 1.0)),
            ChartSampleData(x: 'Don', y: 12, text: '100%', pointColor: const Color.fromRGBO(61, 205, 171, 1.0)),
            ChartSampleData(x: 'Tom', y: 13, text: '100%', pointColor: const Color.fromRGBO(1, 174, 190, 1.0)),
          ],
          cornerStyle: CornerStyle.bothCurve,
          gap: '10%',
          radius: '90%',
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCircularChart(
      key: GlobalKey(),
      title: ChartTitle(text: 'Shot put distance'),
      series: _getRadialBarDefaultSeries(),
      tooltipBehavior: TooltipBehavior(enable: true, format: 'point.x : point.ym'),
    )

        /// Returns default radial series.
        );
  }
}

class ChartSampleData {
  ChartSampleData(
      {this.x, this.y, this.xValue, this.yValue, this.secondSeriesYValue, this.thirdSeriesYValue, this.pointColor, this.size, this.text, this.open, this.close, this.low, this.high, this.volume});

  final dynamic x;

  final num? y;

  final dynamic xValue;

  final num? yValue;

  final num? secondSeriesYValue;

  final num? thirdSeriesYValue;

  final Color? pointColor;

  final num? size;

  final String? text;

  final num? open;

  final num? close;

  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
