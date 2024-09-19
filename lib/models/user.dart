import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class UserModel{
   UserModel({required this.userName, required this.userEmail, required this.address, required this.phone, required this.userPassword, required this.date}) : id = uuid.v4();

  final String id;
  final String userName;
  final String userEmail;
  final String userPassword;
  final String phone;
  final String address;
  final DateTime date;

  // Convert UserModel to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'phone': phone,
      'address': address,
      'date': date.toIso8601String(), // Store as ISO String
    };
  }

   get getFormatedDate {
    return formatter.format(date);
  }

}