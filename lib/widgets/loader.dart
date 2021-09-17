import 'package:flutter/material.dart';

class Loader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 3,
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xffB42F02)),
      backgroundColor: Color(0xff6D7B8A),
    );
  }
}