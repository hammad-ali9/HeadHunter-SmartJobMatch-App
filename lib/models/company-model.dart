import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel{
  String companyId;
  String companyName;
  int numberOfEmployee;
  String location;
  String email;

//<editor-fold desc="Data Methods">
  CompanyModel({
    required this.companyId,
    required this.companyName,
    required this.numberOfEmployee,
    required this.location,
    required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyModel &&
          runtimeType == other.runtimeType &&
          companyId == other.companyId &&
          companyName == other.companyName &&
          numberOfEmployee == other.numberOfEmployee &&
          location == other.location &&
          email == other.email);

  @override
  int get hashCode =>
      companyId.hashCode ^
      companyName.hashCode ^
      numberOfEmployee.hashCode ^
      location.hashCode ^
      email.hashCode;

  @override
  String toString() {
    return 'CompanyModel{' +
        ' companyId: $companyId,' +
        ' companyName: $companyName,' +
        ' numberOfEmployee: $numberOfEmployee,' +
        ' location: $location,' +
        ' email: $email,' +
        '}';
  }

  CompanyModel copyWith({
    String? companyId,
    String? companyName,
    int? numberOfEmployee,
    String? location,
    String? email,
  }) {
    return CompanyModel(
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      numberOfEmployee: numberOfEmployee ?? this.numberOfEmployee,
      location: location ?? this.location,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyId': this.companyId,
      'companyName': this.companyName,
      'numberOfEmployee': this.numberOfEmployee,
      'location': this.location,
      'email': this.email,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      companyId: map['companyId'] as String,
      companyName: map['companyName'] as String,
      numberOfEmployee: map['numberOfEmployee'] as int,
      location: map['location'] as String,
      email: map['email'] as String,
    );
  }
  factory CompanyModel.fromDoc(DocumentSnapshot map) {
    return CompanyModel(
      companyId: map['companyId'] as String,
      companyName: map['companyName'] as String,
      numberOfEmployee: map['numberOfEmployee'] as int,
      location: map['location'] as String,
      email: map['email'] as String,
    );
  }

//</editor-fold>
}