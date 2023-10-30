import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/model/sources_responses.dart';
import 'package:news_app/data/repos/news_repo/data_sources/offline_data_sources.dart';
import 'package:news_app/data/repos/news_repo/data_sources/online_data_sources.dart';

class NewsRepo
{
  OnlineDataSources onlineDataSources;
  OfflineDataSources offlineDataSources;

  NewsRepo(this.onlineDataSources, this.offlineDataSources);

  Future<SourcesResponses?> getSources(String categoryId) async
  {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile)
      {
       SourcesResponses responses = await onlineDataSources.getSources(categoryId);
       offlineDataSources.saveSources(responses, categoryId);
       return responses;
      }
    else
      {
        return await offlineDataSources.getSources(categoryId);
      }
  }
}