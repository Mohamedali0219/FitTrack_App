class Meal {
  String id;
  String name;
  String description;
  int calories;
  int preparationTime;
  String date;
  String mealType;
  String imageUrl;
  Nutrition nutrition;

  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.calories,
    required this.preparationTime,
    required this.date,
    required this.mealType,
    required this.imageUrl,
    required this.nutrition,
  });

  // Factory method to create a Meal object from Firebase data
  factory Meal.fromFirestore(Map<String, dynamic> data, String id) {
    return Meal(
      id: id,
      name: data['name'],
      description: data['description'],
      calories: data['calories'],
      preparationTime: data['preparationTime'],
      date: data['date'],
      mealType: data['mealType'],
      imageUrl: data['imageUrl'],
      nutrition: Nutrition.fromMap(data['nutrition']),
    );
  }

  // Method to convert a Meal object into a map to send to Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'calories': calories,
      'preparationTime': preparationTime,
      'date': date,
      'mealType': mealType,
      'imageUrl': imageUrl,
      'nutrition': nutrition.toMap(),
    };
  }
}

class Nutrition {
  double fat;
  double protein;
  double carbs;

  Nutrition({
    required this.fat,
    required this.protein,
    required this.carbs,
  });

  // Factory method to create Nutrition object from Firestore data
  factory Nutrition.fromMap(Map<String, dynamic> data) {
    return Nutrition(
      fat: data['fat'],
      protein: data['protein'],
      carbs: data['carbs'],
    );
  }

  // Method to convert Nutrition object into a map to send to Firestore
  Map<String, dynamic> toMap() {
    return {
      'fat': fat,
      'protein': protein,
      'carbs': carbs,
    };
  }
}
