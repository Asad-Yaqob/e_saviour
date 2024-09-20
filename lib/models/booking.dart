import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_saviour/models/user.dart';

enum BookingStatus { pending, confirmed, cancelled, completed }

enum AmbulanceType { basicLifeSupport, advanceLifeSupport }

class Booking {
  Booking({
    required this.userId,
    required this.amulanceId,
    required this.driverId,
    required this.hospitalId,
    required this.pickupLocation,
    required this.userPhone,
    required this.isEmergency,
    required this.type,
  })  : status = BookingStatus.pending,
        createdAt = Timestamp.now(),
        updatedAt = Timestamp.now(),
        bookingId = uuid.v4();

  final String bookingId;
  final String userId;
  final String amulanceId;
  final String hospitalId;
  final String driverId;
  final BookingStatus status;
  final String pickupLocation;
  final String userPhone;
  final bool isEmergency;
  final AmbulanceType type;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'userId': userId,
      'amulanceId': amulanceId,
      'hospitalId': hospitalId,
      'driverId': driverId,
      'status': status,
      'pickupLocation': pickupLocation,
      'userPhone': userPhone,
      'isEmergency': isEmergency,
      'type': type,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
