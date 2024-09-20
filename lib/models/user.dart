import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class UserModel {
  UserModel({
    required this.userName,
    required this.userEmail,
    required this.address,
    required this.phone,
  })  : id = uuid.v4(),
        createdAt = Timestamp.now(),
        updatedAt = Timestamp.now();

  final String id;
  final String userName;
  final String userEmail;
  final String phone;
  final String address;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  // Convert UserModel to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'phone': phone,
      'address': address,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
