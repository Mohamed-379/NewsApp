import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_list/news_details/details_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  static const routeName = "webView";

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
      controller = WebViewController()
      ..loadRequest(
          Uri.parse(DetailsScreen.url),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}