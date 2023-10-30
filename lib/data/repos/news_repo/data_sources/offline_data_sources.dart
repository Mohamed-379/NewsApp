import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/data/model/sources_responses.dart';

class OfflineDataSources
{

  Future<SourcesResponses?> getSources(String categoryId) async
  {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("tabs");
    DocumentReference documentReference = collectionReference.doc(categoryId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if(documentSnapshot.data() == null) return null;
    return SourcesResponses.fromJson(documentSnapshot.data());
  }

  saveSources(SourcesResponses sourcesResponses, String categoryId)
  {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("tabs");
    DocumentReference documentReference = collectionReference.doc(categoryId);
    documentReference.set(sourcesResponses.toJson());
  }
}