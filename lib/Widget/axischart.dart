import 'package:cleverpot/Utily/Constants.dart';
import 'package:cleverpot/Utily/Function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AxisChart extends StatelessWidget {
  AxisChart(this.title);

  final String title;
  final FirebaseDatabase db =
      FirebaseDatabase(databaseURL: Constans.url_database);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List records = [];

  void populateList() {}

  var data = FirebaseDatabase.instance
      .reference()
      .child(FirebaseAuth.instance.currentUser.uid)
      .child("records");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db
            .reference()
            .child(_auth.currentUser.uid)
            .child("records")
            .child(FunctionHelper.selectFolder(title))
            .onValue
            .map((event) => {records = event.snapshot.value, print(records)}),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            print(records);
            return CircularProgressIndicator();
          } else if (snap.connectionState == ConnectionState.active) {
            print('done');
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
          } else {
            return Text(snap.error.toString());
          }
        });
  }
}

class Records {
  Records(this.day, this.records);
  final int day;
  final int records;
}
