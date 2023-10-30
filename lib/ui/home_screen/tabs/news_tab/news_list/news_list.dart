import 'package:flutter/material.dart';
import 'package:news_app/data/repos/news_repo/data_sources/online_data_sources.dart';
import 'package:news_app/data/model/articles_responses.dart';
import 'package:news_app/widgets/build_articles.dart';
import 'package:news_app/widgets/error_widget.dart';
import 'package:news_app/widgets/loadeing_widget.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: OnlineDataSources.getArticles(sourceId),
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            return buildArticlesListView(snapshot.data!);
          }
          else if(snapshot.hasError)
          {
            return ErrorView(message: snapshot.error.toString());
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