import 'package:flutter/material.dart';
import 'package:news_app/data/repos/news_repo/data_sources/online_data_sources.dart';

import '../../../../data/model/sources_responses.dart';
import '../../../../data/repos/news_repo/data_sources/offline_data_sources.dart';
import '../../../../data/repos/news_repo/news_repo.dart';

class NewsTabModelView extends ChangeNotifier
{
  List<Sources> sources = [];
  bool isLoading = true;
  String? errorMessage;
  NewsRepo newsRepo = NewsRepo(OnlineDataSources(), OfflineDataSources());

  void getSources(String categoryId) async
  {
    isLoading = true;
    notifyListeners();
    try{
      SourcesResponses? sourcesResponses = await newsRepo.getSources(categoryId);
      if(sourcesResponses != null && sourcesResponses.sources?.isNotEmpty == true)
        {
          isLoading = false;
          sources = sourcesResponses.sources!;
          notifyListeners();
        }
      else{
        throw "Something went wrong please try again later...!";
      }

    }catch(error){
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
      }
  }
}