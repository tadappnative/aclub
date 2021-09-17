import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class IosBar extends StatefulWidget implements ObstructingPreferredSizeWidget {
  final String title;
  final bool back;
  final Function openDrawer;
  final Function goBack;

  const IosBar({Key? key,
    required this.title,
    required this.back,
    required this.openDrawer,
    required this.goBack,
  }) : super(key: key);

  @override
  _IosBarState createState() => _IosBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}

class _IosBarState extends State<IosBar> {

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(widget.title, style: TextStyle(color: Color(0xffffffff))),
      backgroundColor: Color(0xff212121),
      leading: CupertinoButton(
        child: Icon(!widget.back ? FeatherIcons.menu : CupertinoIcons.back, color: Color(0xffffffff)),
        padding: EdgeInsets.zero,
        onPressed: () {
          if (!widget.back) {
            widget.openDrawer();
          } else {
            widget.goBack();
          }
        },
      ),
      trailing: CupertinoButton(
        child: Icon(CupertinoIcons.phone_fill, color: Color(0xffffffff)),
        padding: EdgeInsets.zero,
        onPressed: () {
          launch("tel:+74994099444");
        },
      ),
      padding: EdgeInsetsDirectional.zero,
    );
  }
  
}
