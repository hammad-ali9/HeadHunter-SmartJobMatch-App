import 'package:cloud_firestore/cloud_firestore.dart';

class SeekerModel{
  String userId;
  String userName;
  int age;
  String gender;
  String email;
  String password;
  String userRole;


//<editor-fold desc="Data Methods">
  SeekerModel({
    required this.userId,
    required this.userName,
    required this.age,
    required this.gender,
    required this.email,
    required this.password,
    required this.userRole,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is SeekerModel &&
              runtimeType == other.runtimeType &&
              userId == other.userId &&
              userName == other.userName &&
              age == other.age &&
              gender == other.gender &&
              email == other.email &&
              password == other.password &&
              userRole == other.userRole
          );


  @override
  int get hashCode =>
      userId.hashCode ^
      userName.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      email.hashCode ^
      password.hashCode ^
      userRole.hashCode;


  @override
  String toString() {
    return 'SeekerModel{' +
        ' userId: $userId,' +
        ' userName: $userName,' +
        ' age: $age,' +
        ' gender: $gender,' +
        ' email: $email,' +
        ' password: $password,' +
        ' userRole: $userRole,' +
        '}';
  }


  SeekerModel copyWith({
    String? userId,
    String? userName,
    int? age,
    String? gender,
    String? email,
    String? password,
    String? userRole,
  }) {
    return SeekerModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      password: password ?? this.password,
      userRole: userRole ?? this.userRole,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'userName': this.userName,
      'age': this.age,
      'gender': this.gender,
      'email': this.email,
      'password': this.password,
      'userRole': this.userRole,
    };
  }

  factory SeekerModel.fromMap(Map<String, dynamic> map) {
    return SeekerModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userRole: map['userRole'] as String,
    );
  }
  factory SeekerModel.fromDoc(DocumentSnapshot map) {
    return SeekerModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userRole: map['userRole'] as String,
    );
  }


//</editor-fold>
}