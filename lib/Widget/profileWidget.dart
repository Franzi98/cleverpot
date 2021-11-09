import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imgPath;
  final VoidCallback onClicked;
  final bool isEdit;

  const ProfileWidget(
      {Key? key,
      required this.imgPath,
      required this.onClicked,
      this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            child: buildEditIcon(color),
            bottom: 0,
            right: 4,
          )
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imgPath);
    return ClipOval(
      child: Ink.image(
        image: image,
        fit: BoxFit.cover,
        width: 128,
        height: 128,
        child: InkWell(
          onTap: onClicked,
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
      color: color,
      all: 8,
      child: buildCircle(
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
          all: 3,
          color: Colors.red));

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
