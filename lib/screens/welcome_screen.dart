import 'package:aclub/screens/webview_screen.dart';
import 'package:aclub/widgets/button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/images/1024.png", width: 200),
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.00),
        child: Button(
          label: "Мне больше 18 лет",
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => WebViewScreen())
          ),
        ),
      ),
    );
  }

}