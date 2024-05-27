import 'package:cloud_firestore/cloud_firestore.dart';

//we need the dcoumnt id to update the seleted user, so that why we added document id
class UserModel {
  final String? name;
  final String? age;
  final String? location;
  final String? id;
  final String? documentId; //We use this field for firestore update the document

  UserModel({
    required this.name,
    required this.age,
    required this.location,
    required this.id,
    this.documentId, // Updated documentId field to be nullable
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc, String? documentId) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      name: data['name'] ?? '',
      age: data['age'] ?? '',
      location: data['location'] ?? '',
      id: data['id'] ?? '',
      documentId: documentId,
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
