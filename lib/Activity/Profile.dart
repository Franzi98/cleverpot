import 'package:cleverpot/Activity/editProfile.dart';
import 'package:cleverpot/Class/User.dart';
import 'package:cleverpot/Utily/Constants.dart';
import 'package:cleverpot/Widget/profileWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final UserClass user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Constans.colorAppBar,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(IconData(57776)),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
              imgPath: "imgPath",
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfile(user: user)));
              }),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
        ],
      ),
    );
  }
}

Widget buildName(UserClass user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
