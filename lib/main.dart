import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen/home_screen.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_list/news_details/details_screen.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_list/webview/webview.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
  const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  FirebaseFirestore.instance.disableNetwork();
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