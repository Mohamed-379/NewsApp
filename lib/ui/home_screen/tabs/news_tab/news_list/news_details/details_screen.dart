import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_responses.dart';
import '../webview/webview.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "detailsScreen";
  static late String url;
  late Articles articles;
  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    articles = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title ?? "News title", style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontFamily: "Exo"),),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * .09,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8,),
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
                textAlign: TextAlign.end, style: const TextStyle(fontFamily: "Inter", color: Colors.grey),),
              const SizedBox(height: 8,),
              Text(articles.content!, style: const TextStyle(fontFamily: "Poppins"),),
              const SizedBox(height: 16),
              InkWell(
                onTap: (){
                  webViewUrl();
                  Navigator.pushNamed(context, WebView.routeName);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("View Full Article", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold),),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  webViewUrl()
  {
    url = articles.url!;
  }
}