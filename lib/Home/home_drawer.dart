import 'package:cleverpot/Activity/Profile.dart';
import 'package:cleverpot/Activity/signin.dart';
import 'package:cleverpot/Class/User.dart';
import 'package:cleverpot/Helper/authelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            decoration: const BoxDecoration(color: Colors.green),
          ),
          Container(
            color: Colors.white24,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(user: buildUser())));
              },
              leading: const Icon(Icons.person),
              title: const Text("Profilo"),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Container(
            color: Colors.white24,
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Impostazioni"),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Container(
            color: Colors.white24,
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 0.5),
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

  UserClass buildUser() {
    UserClass user = UserClass(
        imagePath: "dasfasd",
        about: "asfafs",
        isDarkMode: false,
        name: "asfas",
        email: "asfafa");

    return user;
  }
}
