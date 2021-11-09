import 'package:cleverpot/Class/User.dart';
import 'package:cleverpot/Widget/profileWidget.dart';
import 'package:cleverpot/Widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:cleverpot/Utily/Constants.dart';

class EditProfile extends StatelessWidget {
  final UserClass user;
  const EditProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Constans.colorAppBar,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(IconData(57776)))],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
              imgPath: user.imagePath, onClicked: () {}, isEdit: true),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: user.name,
            text: user.email,
            onChanged: (name) {},
          )
        ],
      ),
    );
  }
}
