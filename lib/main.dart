import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen/home_screen.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_list/news_details/details_screen.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_list/webview/webview.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          DetailsScreen.routeName: (_) => DetailsScreen(),
          WebView.routeName: (_) => WebView()
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}