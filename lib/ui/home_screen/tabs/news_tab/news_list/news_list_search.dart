import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_responses.dart';
import 'package:news_app/widgets/build_articles.dart';
import 'package:news_app/widgets/loadeing_widget.dart';

class NewsListWithSearch extends StatelessWidget {
  final String q;
  const NewsListWithSearch({super.key, required this.q});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIManager.getArticlesWithSearch(q),
      builder: (context, snapshot) {
        if(snapshot.hasData)
        {
          return buildArticlesListView(snapshot.data!);
        }
        else if(snapshot.hasError)
        {
          return ErrorWidget(snapshot.error.toString());
        }
        else
        {
          return const LoadingWidget();
        }
      },
    );
  }

  Widget buildArticlesListView(List<Articles> article) {
    return ListView.builder(
      itemCount: article.length,
      itemBuilder: (context, index) {
        return BuildArticles(articles: article[index]);
      },
    );
  }
}