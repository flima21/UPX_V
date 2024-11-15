import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  late FirebaseFirestore firebaseFirestore;

  Repository() {
    firebaseFirestore = FirebaseFirestore.instance;
  }
}