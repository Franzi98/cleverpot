import 'dart:collection';
import 'dart:ffi';

import 'package:cleverpot/Class/Data.dart';
import 'package:cleverpot/Widget/axischart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class dbHelper {
  final FirebaseDatabase db = FirebaseDatabase(
      databaseURL:
          "https://cleverpot-d0c1a-default-rtdb.europe-west1.firebasedatabase.app");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///SETTER:
  ///
  Future initialize_user() async {
    //inizializza il pattern del database per un nuovo utente

    Map umidita = {'0': 0, '1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0};
    Map luminosita = {'0': 0, '1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0};
    Map serbatoio = {'0': 0, '1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0};

    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("records")
        .child("Humidity")
        .set(umidita);
    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("records")
        .child("Brightness")
        .set(luminosita);
    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("records")
        .child("Water")
        .set(serbatoio);

    ///STATUS:

    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("status")
        .child("Humidiy")
        .set(0);

    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("status")
        .child("Brightness")
        .set(0);

    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("status")
        .child("Water")
        .set(0);
  }

  ///RECORDS:
  ///

  void updateRecords(List list, String path) async {
    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("records")
        .child("Humidity")
        .child(path)
        .set(list);
  }

  Future setHumidity(double value) async {
    //imposta umidità nel database
    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("status")
        .child("Humidiy")
        .set(value);
  }

  Future setBrightness(int value) async {
    //imposta luce nel database
    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("status")
        .child("Brightness")
        .set(value);
  }

  ///Ausiliarie:

}
