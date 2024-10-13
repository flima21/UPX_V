import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upxv/utils/monitory.dart';

class MonitoryRepository {
  String collectionPath = 'monitory';

  Future<List<Monitory>> findAll() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List<Monitory> monitories = [];

    await firebaseFirestore.collection(collectionPath).get().then((value) => {
      for (var docSnapshot in value.docs) {
        monitories.add(Monitory.fromJson(docSnapshot.data()))
      }
    });

    return monitories;
  }
}