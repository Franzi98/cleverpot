import 'dart:math';

import 'package:cleverpot/Activity/home.dart';
import 'package:cleverpot/Helper/dbhelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class authHelper {
  BuildContext context;
  authHelper(this.context);
  FirebaseAuth auth = FirebaseAuth.instance;
  dbHelper dbhelper = dbHelper();

  Future signIn(String email, String pasword) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: pasword);
      Navigator.of(context)
          .push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        return Home();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Utente non trovato"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password errata"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      }
    }
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await dbhelper.initialize_user();
      Navigator.of(context)
          .push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        return Home();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password troppo debole"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Utente già registrato"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {},
        ),
      ));
    }
  }

  void resetPassword(email) {
    auth.sendPasswordResetEmail(email: email).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {},
        ),
      ));
    });
  }

  Future signOut() async {
    await auth.signOut();
  }

  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  String getUID() {
    return auth.currentUser.uid;
  }

  //Classe SnackBar

}
