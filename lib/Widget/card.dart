import 'package:cleverpot/Helper/dbhelper.dart';
import 'package:cleverpot/Widget/axischart.dart';
import 'package:cleverpot/Widget/dialogcard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class My_Card extends StatefulWidget {
  My_Card(
      {Key? key, required this.title, required this.value, required this.icon})
      : super(key: key);
  final IconData icon;
  final String value;
  final String title;
  @override
  _My_CardState createState() => new _My_CardState();
}

class _My_CardState extends State<My_Card> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 20.0)]),
      child: Card(
        shadowColor: Color(1245),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Color(4291356361), width: 3),
        ),
        color: Colors.green[500],
        margin: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return DialogCard(
                    value: widget.value,
                    title: widget.title,
                  );
                }));
          },
          splashColor: Colors.red[100],
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, size: 60, color: Colors.red[300]),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
                Text(
                  widget.value.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
