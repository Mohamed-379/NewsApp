import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_responses.dart';

import '../ui/home_screen/tabs/news_tab/news_list/news_details/details_screen.dart';

class BuildArticles extends StatelessWidget {
  Articles articles;
  BuildArticles({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName, arguments: articles);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * .232,
                imageUrl: articles.urlToImage!,
                placeholder: (_, __) => const Center(child: CircularProgressIndicator(),),
                errorWidget: (_, __, ___) => const Icon(Icons.error, color: Colors.grey,),
                  ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(articles.source?.name ?? "", style: const TextStyle(fontFamily: "Poppins",color: Colors.grey),),
                Text(articles.title ?? "", style: const TextStyle(fontSize: 14,fontFamily: "Poppins", fontWeight: FontWeight.bold)),
              ],
            )),
            Text("${DateTime.parse(articles.publishedAt ?? "").hour.toString()} hours ago",
              textAlign: TextAlign.end, style: const TextStyle(fontFamily: "Inter", color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}