import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:aclub/widgets/android_bar.dart';
import 'package:aclub/widgets/ios_bar.dart';
import 'package:aclub/widgets/loader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Color black = Color(0xff000000);
  Color grey = Color(0xff6D7B8A);
  Color red = Color(0xffFF004B);

  bool isLoading = true;
  String title = "AlcoClub";
  String link = "https://8230.host/";
  bool back = false;
  late WebViewController webViewController;

  void initState() {
    super.initState();
  }

  void _toggleLoading(value, url) {
    setState(() {
      isLoading = value;
    });
    if (!value) {
      /*
      webViewController.getTitle().then((String  value) => setState(() {
        title = value;
      }));

       */
      webViewController.getTitle().then((String? value) => setState(() {
        title = value!;
      }));
      webViewController.canGoBack().then((bool value) => setState(() {
        back = value;
      }));
    }
  }

  void goToBack() {
    if (back) {
      webViewController.goBack();
    }
  }

  void changeLink(String url) {
    setState(() {
      link = url;
    });
    webViewController.loadUrl(url);
  }

  void openDrawer() {
    _drawerKey.currentState!.openDrawer();
  }

  Future<bool> _backAndroid() async {
    if (back) {
      goToBack();
      return false;
    } else {
      return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Выход", style: TextStyle(color: black, fontWeight: FontWeight.w600, fontSize: 18)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            contentPadding: new EdgeInsets.only(bottom: 0, left: 24, right: 24, top: 15),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Вы уверены, что хотите покинуть приложение?", style: TextStyle(color: grey, fontSize: 16)),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('Нет'),
                style: TextButton.styleFrom(
                  primary: black,
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('Да'),
                style: TextButton.styleFrom(
                  primary: red,
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        }
      );
    }
  }

  Future<bool> _backAndroidCancel() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawerEnableOpenDragGesture: Platform.isIOS ? false : true,
      appBar:  IosBar(
        title: title,
        back: back,
        openDrawer: openDrawer,
        goBack: goToBack,
      ),
      body: WillPopScope(
        onWillPop: _backAndroid,
        child: Column(
          children: [
            isLoading ? Loader() : Container(width: 0, height: 0),
            Expanded(
              child: WebView(
                initialUrl: link,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onPageStarted: (String url) {
                  _toggleLoading(true, url);
                },
                onPageFinished: (String url) {
                  _toggleLoading(false, url);
                },
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: navigationItems(),
      ),
    );
  }

  Widget navigationItems() {
    return ListView(
      key: new PageStorageKey('drawerNavigationList'),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Image.asset("assets/images/1024.png", height: 150),
        ),
        ListTile(
          leading: Icon(FeatherIcons.grid, color: black),
          title: Text("Каталог товаров", style: TextStyle(color: black)),
          onTap: () {
            changeLink("https://8230.host/");
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("ИНФОРМАЦИЯ", style: TextStyle(color: grey)),
        ),
        ListTile(
          leading: Icon(FeatherIcons.messageSquare, color: black),
          title: Text("Отзывы", style: TextStyle(color: black)),
          onTap: () {
            changeLink("https://8230.host/index.php?route=information/information&information_id=4");
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(FeatherIcons.truck, color: black),
          title: Text("Доставка и оплата", style: TextStyle(color: black)),
          onTap: () {
            changeLink("https://8230.host/index.php?route=information/information&information_id=6");
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(FeatherIcons.percent, color: black),
          title: Text("Акции и скидки", style: TextStyle(color: black)),
          onTap: () {
            changeLink("https://8230.host/index.php?route=product/special");
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(FeatherIcons.mapPin, color: black),
          title: Text("Контакты", style: TextStyle(color: black)),
          onTap: () {
            changeLink("https://8230.host/index.php?route=information/contact");
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("Будни с 20:00 до 7:00\nВыходные и праздничные дни\nКРУГЛОСУТОЧНО", style: TextStyle(color: grey)),
        ),
        ListTile(
          title: Text("+7 (499) 409-94-44", style: TextStyle(color: black)),
          onTap: () {
            Navigator.pop(context);
            launch("tel:+74994099444");
          },
        ),
        ListTile(
          title: Text("ПРАВОВАЯ ИНФОРМАЦИЯ", style: TextStyle(color: grey)),
        ),
        ListTile(
          leading: Icon(FeatherIcons.checkSquare, color: black),
          title: Text("Соглашение пользователя", style: TextStyle(color: black)),
          onTap: () {
            changeLink("https://8230.host/index.php?route=information/information&information_id=5");
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

}

