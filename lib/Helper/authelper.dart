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
      await auth.signInWithEmailAndPassword(email: email, password: pasword);
      Navigator.of(context)
          .push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        return Home();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Utente non trovato"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Password errata"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Errore"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await dbhelper.initialize_user();
      Navigator.of(context)
          .push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
        return Home();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Password troppo debole"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Utente già registrato"),
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

  String getUID() {
    return auth.currentUser.uid;
  }

  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("utente eliminato"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      }
    }
  }
}
