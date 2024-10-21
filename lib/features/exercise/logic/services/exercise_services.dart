import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ExerciseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getExercises() async {
    QuerySnapshot snapshot = await _firestore.collection('Additional').get();
    return snapshot.docs
        .map(
          (doc) => {
            'name': doc['Name'],
            'imagePath': doc['imagePath'],
            'kcal': doc['kcal'],
            'time': doc['time'],
            'description': doc['description'],
          },
        )
        .toList();
  }
}

class ExerciseImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> getExerciseImageUrl(String imagePath) async {
    return await _storage.ref('Additional/$imagePath').getDownloadURL();
  }
}
