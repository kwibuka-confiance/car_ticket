class Seat {
  int id;
  String seatNumber;
  bool isReserved;

  Seat({
    required this.id,
    required this.seatNumber,
    required this.isReserved,
  });
}

// 14 seats randomly generated from above class
final List<Seat> leftSeats = [
  Seat(id: 1, seatNumber: "1", isReserved: false),
  Seat(id: 2, seatNumber: "2", isReserved: false),
  Seat(id: 3, seatNumber: "3", isReserved: false),
  Seat(id: 4, seatNumber: "4", isReserved: true),
  Seat(id: 5, seatNumber: "5", isReserved: true),
  Seat(id: 6, seatNumber: "6", isReserved: false),
  Seat(id: 7, seatNumber: "7", isReserved: false),
  Seat(id: 8, seatNumber: "8", isReserved: true),
  Seat(id: 9, seatNumber: "9", isReserved: false),
  Seat(id: 10, seatNumber: "10", isReserved: false),
  Seat(id: 11, seatNumber: "11", isReserved: false),
  Seat(id: 12, seatNumber: "12", isReserved: true),
  Seat(id: 13, seatNumber: "13", isReserved: false),
  Seat(id: 14, seatNumber: "14", isReserved: false),
];

final List<Seat> rightSeats = [
  Seat(id: 1, seatNumber: "1", isReserved: false),
  Seat(id: 2, seatNumber: "2", isReserved: false),
  Seat(id: 3, seatNumber: "3", isReserved: false),
  Seat(id: 4, seatNumber: "4", isReserved: true),
  Seat(id: 5, seatNumber: "5", isReserved: true),
  Seat(id: 6, seatNumber: "6", isReserved: false),
  Seat(id: 7, seatNumber: "7", isReserved: false),
  Seat(id: 8, seatNumber: "8", isReserved: true),
  Seat(id: 9, seatNumber: "9", isReserved: false),
  Seat(id: 10, seatNumber: "10", isReserved: false),
  Seat(id: 11, seatNumber: "11", isReserved: false),
  Seat(id: 12, seatNumber: "12", isReserved: true),
  Seat(id: 13, seatNumber: "13", isReserved: false),
  Seat(id: 14, seatNumber: "14", isReserved: false),
];
