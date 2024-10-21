import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../core/themes/colors_manager.dart';





Future<void> setUserData(String uid,  int age, double weight, double goalWeight, double height) async {
  try {
    // Create or update the user's document in Firestore
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      // 'favoriteActivity': favoriteActivity,
      'age': age,
      'weight': weight,
      'goalWeight': goalWeight,
      'height': height,
      // 'fitnessLevel': fitnessLevel,
      // 'goal': goal,
      
    }, SetOptions(merge: true)); // merge: true ensures the document is updated if it exists

    // print("User data successfully set.");
  } catch (e) {
    // print("Failed to set user data: $e");
  }
}



Future<void> updateUserFitnessData(String uid, UserModel user) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'age': user.age,
      'weight': user.weight,
      'goalWeight': user.goalWeight,
      'height': user.height,
      'fitnessLevel': user.fitnessLevel,
      'goal': user.goal,
      'favoriteActivity': user.favoriteActivity,
      'gender': user.gender,
    });
    // print("User fitness data updated successfully");
  } catch (e) {
    // print("Failed to update user data: $e");
  }
}



Future<void> setFavoriteActivity(String uid, String activity) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'favoriteActivity': activity,
    });
    // print("Favorite activity updated");
  } catch (e) {
    // print("Failed to update activity: $e");
  }
}



// Future<User?> getUserData(String uid) async {
//   try {
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    
//     if (userDoc.exists) {
//       Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
//       User user = User(
//         fullName: data['fullName'],
//         phone: data['phone'],
//         email: data['email'],
//         age: data['age'],
//         weight: data['weight'],
//         goalWeight: data['goalWeight'],
//         height: data['height'],
//         fitnessLevel: data['fitnessLevel'],
//         goal: data['goal'],
//         favoriteActivity: data['favoriteActivity'],
//         gender: data['gender'],
//       );
//       return user;
//     }
//   } catch (e) {
//     print("Failed to fetch user data: $e");
//   }
//   return null;
// }




class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel.instance;

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<void> updateUserFitnessData(String uid, UserModel user) async {
    // Call the Firestore function to update user data
    await FirebaseFirestore.instance.collection('users').doc(uid).update(user.toMap());
    notifyListeners();
  }
}




void showToast(BuildContext context, String text, ToastificationType type) {
  toastification.show(
    context: context,
    title: Text(text),
    autoCloseDuration: const Duration(seconds: 5),
    type: type,
    borderRadius: BorderRadius.circular(15),
    style: ToastificationStyle.minimal,
    primaryColor: ColorsManager.primaryColor,
  );
}
