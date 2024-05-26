import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String age;
  final String location;
  final String id;

  UserModel({
    required this.name,
    required this.age,
    required this.location,
    required this.id,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      name: data['name'] ?? '',
      age: data['age'] ?? '',
      location: data['location'] ?? '',
      id: data['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'location': location,
      'id': id,
    };
  }
}