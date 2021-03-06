import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'appbar_custom.dart';

//! custom web view for websites screen
// (for each card)
class AppView extends StatelessWidget {
  final String url;
  final String title;

  AppView({required this.url, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: appbarCustom(title: title),
      // custom view
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
