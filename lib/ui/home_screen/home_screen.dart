import 'dart:async';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/categories_dm.dart';
import 'package:news_app/ui/home_screen/tabs/categories/categories_tab.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_list/news_list_search.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_tab.dart';
import 'package:news_app/ui/home_screen/tabs/settings/settings_tab.dart';


class HomeScreen  extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTab = CategoriesTab(onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if(currentTab is! CategoriesTab)
          {
            currentTab = CategoriesTab(onCategoryClick);
            setState(() {});
            return Future.value(false);
          }
        else
          {
            return Future.value(true);
          }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App", style: TextStyle(fontFamily: "Exo", fontWeight: FontWeight.w600),),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40)
          )),
          actions: [
            animSearchBar(textEditingController),
            const SizedBox(width: 8,),
          ],
          toolbarHeight: MediaQuery.of(context).size.height * .09,
        ),
        drawer: buildDrawer(),
        body: currentTab,
      ),
    );
  }

  Widget buildDrawer()
  {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            width: double.infinity,
            color: Colors.blue,
            child: const Center(child: Text("Welcome Guest!",
              style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Exo"),)),
          ),
          const SizedBox(height: 16,),
          InkWell(
              onTap: () {
                widgetNavigation(currentTab, CategoriesTab(onCategoryClick));
              },
              child: buildRow(Icons.list, "Categories")),
          const SizedBox(height: 8,),
          InkWell(
              onTap: () {
                widgetNavigation(currentTab, const SettingsTab());
              },
              child: buildRow(Icons.settings, "Settings"))
        ],
      ),
    );
  }

  Widget buildRow(IconData icon, String title)
  {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(icon,color: Colors.black,size: 32,),
            const SizedBox(width: 8,),
            Text(title, style: const TextStyle(fontSize: 32, fontFamily: "Exo",fontWeight: FontWeight.bold),)
          ],
        ),
      );
  }

  onCategoryClick(CategoryDM categoryDM)
  {
    setState(() {
      currentTab = NewsTab(categoryDM.id);
    });
  }

  AnimSearchBar animSearchBar(TextEditingController q)
  {
    return AnimSearchBar(
      width: 300,
      textController: q,
      onSuffixTap: (_){},
      onSubmitted: (_){
        setState(() {
          currentTab = NewsListWithSearch(q: q.text);
        });
      },
      boxShadow: false,
      color: Colors.transparent,
      suffixIcon: const Icon(Icons.add, color: Colors.black,),
      prefixIcon: const Icon(Icons.search,),
    );
  }

  widgetNavigation(Widget currentWidget, Widget nextWidget)
  {
    setState(() {
      currentTab = nextWidget;
    });
  }
}