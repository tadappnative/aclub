import 'package:flutter/material.dart';
import 'package:aclub/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WebViewApp());
}

class WebViewApp extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AlcoClub",
      home: WelcomeScreen(),
      theme: ThemeData(
        primaryColor: Color(0xff212121),
      ),
      themeMode: ThemeMode.light,
    );
  }

}
