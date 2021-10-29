import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AxisChart extends StatelessWidget {
  AxisChart(this.records);

  final List records;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        title: ChartTitle(text: "Ultima settimana"),
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<Records, int>>[
          LineSeries(
              dataSource: <Records>[
                Records(1, records[0]),
                Records(2, records[1]),
                Records(3, records[2]),
                Records(4, records[3]),
                Records(5, records[4]),
                Records(6, records[5]),
                Records(7, records[6]),
              ],
              xValueMapper: (Records records, _) => records.day,
              yValueMapper: (Records records, _) => records.records)
        ],
      ),
    );
  }
}

class Records {
  Records(this.day, this.records);
  final int day;
  final int records;
}
