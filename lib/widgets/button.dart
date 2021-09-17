import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  Button({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Image.asset("assets/images/age.png", height: 20),
            ),
            Text(label, style: TextStyle(color: Color(0xffffffff), fontSize: 16))
          ],
        ),
        color: Color(0xffB42F02),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        onPressed: onPressed,
      ),
    ) : ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
        onPressed: onPressed,
        color: Color(0xffB42F02),
        textColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        hoverElevation: 2,
        focusElevation: 2,
        highlightElevation: 2,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Image.asset("assets/images/age.png", height: 20),
            ),
            Text(label, style: TextStyle(color: Color(0xffffffff), fontSize: 18))
          ],
        ),
      ),
    );
  }
}

