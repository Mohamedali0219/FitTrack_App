class UserModel {
  String? uid,
      email,
      password,
      fullName,
      phone,
      goal,
      favoriteActivity,
      fitnessLevel,
      gender,
      weight,
      goalWeight,
      height;
  int? age;

  static UserModel? _instance;
  static UserModel get instance => _instance ??= UserModel._();
  UserModel._();

  UserModel.fromJSON({
    this.email,
    this.password,
    this.fullName,
    this.phone,
    this.age,
    this.weight,
    this.goalWeight,
    this.height,
    this.fitnessLevel,
    this.goal,
    this.favoriteActivity,
    this.gender,
  });

  get getUserProfileData => {
        'name': fullName,
        'age': age,
        'weight': weight,
        'phone ': phone,
        'height': height,
      };

  setNewUser({
    required String id,
    required String email,
    required String name,
    required String phone,
  }) {
    uid = id;
    fullName = name;
    email = email;
    phone = phone;
  }

  set setUserID(String value) => uid = value;
  set setFavoriteActivity(String value) => favoriteActivity = value;
  set setAge(int value) => age = value;
  set setWeight(String value) => weight = value;
  set setGoalWeight(String value) => goalWeight = value;
  set setHeight(String value) => height = value;
  set setFitnessLevel(String value) => fitnessLevel = value;
  set setGoal(String value) => goal = value;

  String? get getUID => uid!;
  String? get getFullName => fullName!;
  String? get getEmail => email!;
  String? get getPhone => phone!;
  String? get getFavoriteActivity => favoriteActivity!;
  int? get getAge => age!;
  String? get getWeight => weight!;
  String? get getGoalWeight => goalWeight!;
  String? get getHeight => height!;
  String? get getFitnessLevel => fitnessLevel!;
  String? get getGoal => goal!;

  // Convert a User object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'phone': phone,
      'age': age,
      'weight': weight,
      'goalWeight': goalWeight,
      'height': height,
      'fitnessLevel': fitnessLevel,
      'goal': goal,
      'favoriteActivity': favoriteActivity,
      'gender': gender,
    };
  }

  Map<String, dynamic> toMapAdditionalData() {
    return {
      'age': age,
      'weight': weight,
      'goalWeight': goalWeight,
      'height': height,
      'fitnessLevel': fitnessLevel,
      'goal': goal,
      'favoriteActivity': favoriteActivity,
    };
  }

  // Convert a Firestore Document to a User object
  fromFirestore(Map<String, dynamic> json) {
    email = json['email'] ?? "";
    fullName = json['fullName'] ?? "";
    phone = json['phone'] ?? "";
    age = json['age'] ?? "";
    weight = json['weight'] ?? "";
    goalWeight = json['goalWeight'] ?? "";
    height = json['height'] ?? "";
    fitnessLevel = json['fitnessLevel'] ?? "";
    goal = json['goal'] ?? "";
    favoriteActivity = json['favoriteActivity'] ?? "";
    gender = json['gender'] ?? "";
  }

  @override
  String toString() {
    return "$fullName $email $phone $age $weight $goalWeight $height $fitnessLevel $goal $favoriteActivity ";
  }
}
