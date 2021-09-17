import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  final Function openDrawer;
  final Function goBack;

  const AndroidBar({Key? key,
    required this.title,
    required this.back,
    required this.openDrawer,
    required this.goBack,
  }) : super(key: key);

  @override
  _AndroidBarState createState() => _AndroidBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AndroidBarState extends State<AndroidBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      foregroundColor: Color(0xffffffff),
      backgroundColor: Color(0xff212121),
      brightness: Brightness.dark,
      leading: IconButton(
        icon: Icon(!widget.back ? Icons.menu : Icons.arrow_back),
        onPressed: () {
          if (!widget.back) {
            widget.openDrawer();
          } else {
            widget.goBack();
          }
        },
      ),
      actions: [
        IconButton(
          icon: new Icon(Icons.phone),
          onPressed: () {
            launch("tel:+74994099444");
          },
        ),
      ],
    );
  }

}