import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_saviour/models/user.dart';

class Driver {
  Driver({
    required this.driverName,
    required this.email,
    required this.password,
    required this.address,
    required this.area,
  })  : driverId = uuid.v4(),
        createdAt = Timestamp.now(),
        updatedAt = Timestamp.now();

  final String driverId;
  final String driverName;
  final String email;
  final String password;
  final String address;
  final String area;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Map<String, dynamic> toMap(){
    return {
      'driverId': driverId,
      'driverName': driverName,
      'email': email,
      'password': password,
      'address': address,
      'area': area,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
