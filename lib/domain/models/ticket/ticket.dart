import 'package:car_ticket/domain/models/seat.dart';

class ExcelTicket {
  String id;
  String carId;
  String destinationId;
  String userId;
  String seatNumbers;
  List<Seat> seats;
  String carDestinationFromTime;
  String carDestinationToTime;
  bool isExpired;
  bool isUsed;
  String price;
  DateTime? createdAt;

  ExcelTicket({
    required this.id,
    required this.carId,
    required this.destinationId,
    required this.userId,
    required this.seatNumbers,
    required this.seats,
    required this.carDestinationFromTime,
    required this.carDestinationToTime,
    required this.isExpired,
    required this.isUsed,
    required this.price,
    this.createdAt,
  });

  ExcelTicket copyWith({
    String? id,
    String? carId,
    String? destinationId,
    String? userId,
    String? seatNumbers,
    List<Seat>? seats,
    String? carDestinationFromTime,
    String? carDestinationToTime,
    bool? isExpired,
    bool? isUsed,
    String? price,
    DateTime? createdAt,
  }) {
    return ExcelTicket(
      id: id ?? this.id,
      carId: carId ?? this.carId,
      destinationId: destinationId ?? this.destinationId,
      userId: userId ?? this.userId,
      seatNumbers: seatNumbers ?? this.seatNumbers,
      seats: seats ?? this.seats,
      carDestinationFromTime:
          carDestinationFromTime ?? this.carDestinationFromTime,
      carDestinationToTime: carDestinationToTime ?? this.carDestinationToTime,
      isExpired: isExpired ?? this.isExpired,
      isUsed: isUsed ?? this.isUsed,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'carId': carId,
      'destinationId': destinationId,
      'userId': userId,
      'seatNumbers': seatNumbers,
      'seats': seats.map((seat) => seat.toDocument()).toList(),
      'isExpired': isExpired,
      'isUsed': isUsed,
      'carDestinationFromTime': carDestinationFromTime,
      'carDestinationToTime': carDestinationToTime,
      'createdAt': createdAt ?? DateTime.now(),
      'price': price,
    };
  }

  factory ExcelTicket.fromDocument(Map<String, dynamic> document) {
    return ExcelTicket(
      id: document['id'],
      carId: document['carId'],
      destinationId: document['destinationId'],
      userId: document['userId'],
      seatNumbers: document['seatNumbers'],
      seats: List<Seat>.from(
        document['seats'].map((seat) => Seat.fromDocument(seat)),
      ),
      isExpired: document['isExpired'],
      isUsed: document['isUsed'],
      carDestinationFromTime: document['carDestinationFromTime'],
      carDestinationToTime: document['carDestinationToTime'],
      createdAt: document['createdAt'].toDate(),
      price: document['price'],
    );
  }

  static ExcelTicket empty = ExcelTicket(
    id: '',
    carId: '',
    destinationId: '',
    userId: '',
    seatNumbers: '',
    seats: [],
    carDestinationFromTime: '',
    carDestinationToTime: '',
    isExpired: false,
    isUsed: false,
    createdAt: DateTime.now(),
    price: '',
  );
}
