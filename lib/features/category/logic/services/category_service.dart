import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCategories() async {
    QuerySnapshot snapshot = await _firestore.collection('Categories').get();
    return snapshot.docs
        .map((doc) => {'name': doc['name'], 'imagePath': doc['imagePath']})
        .toList();
  }
}

class ImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> getCategoryImageUrl(String imagePath) async {
    return await _storage.ref('Categories/$imagePath').getDownloadURL();
  }
}
