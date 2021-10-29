import 'package:cleverpot/Activity/signin.dart';
import 'package:cleverpot/Helper/authelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class home_drawer extends StatelessWidget {
  home_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authHelper auth = authHelper(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(auth.getUID()),
            accountEmail: Text(FirebaseAuth.instance.currentUser.email),
            decoration: BoxDecoration(color: Colors.green),
          ),
          Container(
            color: Colors.white24,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("Profilo"),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Container(
            color: Colors.white24,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Impostazioni"),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Container(
            color: Colors.white24,
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Signup()));
                auth.signOut();
              },
            ),
          )
        ],
      ),
    );
  }
}
