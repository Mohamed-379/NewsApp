import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/sources_responses.dart';
import 'package:news_app/ui/home_screen/tabs/news_tab/news_tab_model_view.dart';
import 'package:news_app/widgets/loadeing_widget.dart';
import '../../../../widgets/error_widget.dart';
import 'news_list/news_list.dart';

class NewsTab extends StatefulWidget {
  final String categoryId;
  const NewsTab(this.categoryId, {super.key});
  static const routeName = "NewsTab";

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsTabModelView newsTabModelView = NewsTabModelView();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      newsTabModelView.getSources(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentView;

    return BlocBuilder<NewsTabModelView, NewsTabStates>(
      bloc: newsTabModelView,
      builder: (context, state) {
        if(state is NewsTabLoadingState)
        {
          currentView = const LoadingWidget();
        }
        else if(state is NewsTabSuccessState)
        {
          currentView = buildTabs(state.sources);
        }
        else
        {
          currentView = ErrorView(message: (state as NewsTabErrorState).message);
        }

        return currentView;
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