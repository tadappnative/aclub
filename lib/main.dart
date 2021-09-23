import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:aclub/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("52840c31-55ac-4c71-835c-1a46485599c1");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
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
