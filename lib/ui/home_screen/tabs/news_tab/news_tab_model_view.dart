import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repos/news_repo/data_sources/online_data_sources.dart';

import '../../../../data/model/sources_responses.dart';
import '../../../../data/repos/news_repo/data_sources/offline_data_sources.dart';
import '../../../../data/repos/news_repo/news_repo.dart';

class NewsTabModelView extends Cubit<NewsTabStates>
{
  NewsRepo newsRepo = NewsRepo(OnlineDataSources(), OfflineDataSources());

  NewsTabModelView(): super(NewsTabLoadingState());

  void getSources(String categoryId) async
  {
    emit(NewsTabLoadingState());
    try{
      SourcesResponses? sourcesResponses = await newsRepo.getSources(categoryId);
      if(sourcesResponses != null && sourcesResponses.sources?.isNotEmpty == true)
        {
          emit(NewsTabSuccessState(sources: sourcesResponses.sources!));
        }
      else{
        throw "Something went wrong please try again later...!";
      }

    }catch(error){
      emit(NewsTabErrorState(message: error.toString()));
      }
  }
}

class NewsTabStates{}
class NewsTabLoadingState extends NewsTabStates{}
class NewsTabSuccessState extends NewsTabStates{
  List<Sources> sources = [];
  NewsTabSuccessState({required this.sources});
}
class NewsTabErrorState extends NewsTabStates{
  String message;
  NewsTabErrorState({required this.message});
}