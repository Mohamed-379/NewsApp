import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';

import '../../../../data/model/sources_responses.dart';

class NewsTabModelView extends ChangeNotifier
{
  List<Sources> sources = [];
  bool isLoading = true;
  String? errorMessage;

  void getSources(String categoryId) async
  {
    isLoading = true;
    notifyListeners();
    try{
      sources = await APIManager.getSources(categoryId);
      isLoading = false;
      notifyListeners();
    }catch(error){
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
      }
  }
}