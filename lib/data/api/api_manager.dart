import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/data/model/articles_responses.dart';
import 'package:news_app/data/model/sources_responses.dart';

abstract class APIManager
{
  static const String urlBase = "newsapi.org";
  static const String sourceEndPoint = "/v2/top-headlines/sources";
  static const String apiKey = "faf82f8c8199487ba373e64d67d5463b";
  static const String articleEndPoint = "/v2/everything";

  static Future<List<Sources>> getSources(String category) async
  {
    Uri url = Uri.parse("https://$urlBase$sourceEndPoint?apiKey=$apiKey&category=$category");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SourcesResponses sourcesResponses = SourcesResponses.fromJson(json);
    if(response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponses.sources?.isNotEmpty == true)
      {
        return sourcesResponses.sources!;
      }
    throw Exception(sourcesResponses.message);
  }

  static Future<List<Articles>>getArticles(String sourceId) async
  {
    Uri url = Uri.https(urlBase, articleEndPoint, {
      "apiKey" : apiKey,
      "sources" : sourceId,
    });
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ArticlesResponses articlesResponses = ArticlesResponses.fromJson(json);
    if(response.statusCode >= 200 && response.statusCode < 300 && articlesResponses.articles?.isNotEmpty == true)
      {
        return articlesResponses.articles!;
      }
    throw Exception("Something went wrong please try again later...!");
  }

  static Future<List<Articles>>getArticlesWithSearch(String q) async
  {
    Uri url = Uri.https(urlBase, articleEndPoint, {
      "apiKey" : apiKey,
      "q" : q,
    });
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ArticlesResponses articlesResponses = ArticlesResponses.fromJson(json);
    if(response.statusCode >= 200 && response.statusCode < 300 && articlesResponses.articles?.isNotEmpty == true)
    {
      return articlesResponses.articles!;
    }
    throw Exception("Something went wrong please try again later...!");
  }
}