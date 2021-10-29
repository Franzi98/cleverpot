import 'dart:ffi';

import 'package:cleverpot/Helper/dbhelper.dart';
import 'package:cleverpot/Widget/axischart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DialogCard extends StatefulWidget {
  DialogCard({Key? key, required this.value, required this.title})
      : super(key: key);

  final String value;
  final String title;

  @override
  _DialogCardState createState() => _DialogCardState();
}

class _DialogCardState extends State<DialogCard> {
  final FirebaseDatabase db = FirebaseDatabase(
      databaseURL:
          "https://cleverpot-d0c1a-default-rtdb.europe-west1.firebasedatabase.app");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  dbHelper _helper = dbHelper();
  int _value = 0;
  List _records = [];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  String selectFolder(String title) {
    if (title == 'Umidità') {
      return 'Humidity';
    } else if (title == 'Luminosità') {
      return 'Brightness';
    } else if (title == 'Serbatoio') {
      return 'Water';
    } else {
      return 'error';
    }
  }

  Future updateData() async {
    if (_value != _records.last) {
      _records = _records.sublist(1);
      _records.add(_value);
      await db
          .reference()
          .child(_auth.currentUser.uid)
          .child("records")
          .child(selectFolder(widget.title))
          .set(_records);
    }
  }

  Future getData() async {
    Map data = {};
    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("records")
        .onValue
        .listen((event) {
      data = Map.from(event.snapshot.value);

      setState(() {
        _records = data[selectFolder(widget.title)];
        _value = _records.last;
      });
    });
  }

  void updateRecords() {
    //_records = _records.sublist(1);

    setState(() {
      //_records.add(_value);
    });
  }

  void _incrementValue() {
    setState(() {
      _value++;
    });
  }

  void _decrementValue() {
    setState(() {
      _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double heigthSize = MediaQuery.of(context).size.height;
    final double widhSize = MediaQuery.of(context).size.width;

    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      backgroundColor: Colors.red[300],
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.red[200]),
        child: Column(
          children: [
            Container(
                height: heigthSize / 2,
                width: widhSize,
                child: FutureBuilder(
                    future: getData(),
                    builder: (_, snapshot) {
                      return AxisChart(_records);
                    })),
            //child: AxisChart(_records)),
            Container(
                padding: EdgeInsets.only(top: 0),
                height: heigthSize / 2 / 2 / 2,
                width: widhSize,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white24),
                          child: FloatingActionButton(
                            heroTag: "btn1",
                            child: Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _decrementValue();
                            },
                          )),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white24),
                        child: FloatingActionButton(
                          heroTag: "btn2",
                          child: Text("$_value"),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white24),
                          child: FloatingActionButton(
                            heroTag: "btn3",
                            onPressed: () {
                              _incrementValue();
                            },
                            child: Icon(Icons.arrow_right),
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green))),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.black;
                },
              ),
            ),
            onPressed: () async {
              setState(() {});

              Navigator.of(context).pop();

              ///salvare dati su db;
            },
            child: Text("Salva")),
        ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green))),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5);
                  return Colors.black;
                },
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Chiudi")),
      ],
    );
  }
}
