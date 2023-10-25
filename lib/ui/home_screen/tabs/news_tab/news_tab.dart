import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/sources_responses.dart';

import 'news_list/news_list.dart';

class NewsTab extends StatefulWidget {
  final String categoryId;
  const NewsTab(this.categoryId, {super.key});
  static const routeName = "NewsTab";

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: APIManager.getSources(widget.categoryId),
          builder: (context, snapshot) {
            if(snapshot.hasData)
              {
                return buildTabs(snapshot.data!);
              }
            else if(snapshot.hasError)
              {
                return Text(snapshot.error.toString());
              }
            else
              {
                return const Center(child: CircularProgressIndicator());
              }
          },
      );
  }

  Widget buildTabs(List<Sources> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          const SizedBox(height: 8,),
          TabBar(
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: list.map((source) => tabBuilder(source.name??"", currentIndex == list.indexOf(source)),).toList()),
          Expanded(
            child: TabBarView(
                children: list.map((source) => NewsList(sourceId: source.id!,),).toList())),
        ],
      ),
    );
  }

  Widget tabBuilder(String name, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: isSelected ? Colors.blue : Colors.white,
        border: Border.all(color: Colors.blue, width: 2)
      ),
      child: Text(name, style: TextStyle(fontFamily: "Exo",fontWeight: FontWeight.w500,color: isSelected ? Colors.white : Colors.blue),),
    );
  }
}