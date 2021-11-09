import 'package:cleverpot/Home/home_drawer.dart';
import 'package:cleverpot/Utily/Constants.dart';
import 'package:cleverpot/Widget/card.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class home_body extends StatefulWidget {
  home_body({Key? key}) : super(key: key);

  @override
  _home_bodyState createState() => _home_bodyState();
}

class _home_bodyState extends State<home_body> {
  final FirebaseDatabase db =
      FirebaseDatabase(databaseURL: Constans.url_database);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String water = '';
  String light = '';
  String humidity = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    Map data = {};
    db
        .reference()
        .child(_auth.currentUser.uid)
        .child("status")
        .once()
        .then((value) => {
              data = Map.of(value.value),
              water = data['Water'].toString(),
              light = data['Brightness'].toString(),
              humidity = data['Humidity'].toString(),
            });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                backgroundColor: Constans.colorAppBar,
              ),
              backgroundColor: Colors.green[100],
              drawer: home_drawer(),
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        colors: [Colors.green, Colors.greenAccent])),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    My_Card(
                      title: "Umidità",
                      icon: Icons.thermostat,
                      value: humidity,
                    ),
                    My_Card(
                      title: "Luminosità",
                      icon: Icons.lightbulb,
                      value: light,
                    ),
                    My_Card(
                      title: "Serbatoio",
                      icon: Icons.water,
                      value: water,
                    )
                  ],
                ),
              ),
            );
          } else {
            return Text(snapshot.hasError.toString());
          }
        });
  }
}
