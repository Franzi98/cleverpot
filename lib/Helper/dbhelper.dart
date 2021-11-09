import 'package:cleverpot/Utily/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

class dbHelper {
  final FirebaseDatabase db =
      FirebaseDatabase(databaseURL: Constans.url_database);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///SETTER:
  ///
  Future initialize_user() async {
    //inizializza il pattern del database per un nuovo utente

    Map umidita = {'0': 0, '1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0};
    Map luminosita = {'0': 0, '1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0};
    Map serbatoio = {'0': 0, '1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0};
    Map profile = {
      'imgPath': "",
      'name': _auth.currentUser.uid,
      'about': " ",
      'isDarkMode': false,
      'email': _auth.currentUser.email
    };

    await db
        .reference()
        .child(_auth.currentUser.uid)
        .child("profile")
        .set(profile);

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
        .child("Humidity")
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
