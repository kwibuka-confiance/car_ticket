class JourneyDestination {
  final String id;
  final String description;
  final String imageUrl;
  final String price;
  final String duration;
  final String from;
  final String to;
  final String createdAt;
  final String updatedAt;
  final String carId;
  final bool isAssigned;

  JourneyDestination({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.duration,
    required this.from,
    required this.to,
    required this.createdAt,
    required this.updatedAt,
    required this.carId,
    required this.isAssigned,
  });

  static JourneyDestination empty = JourneyDestination(
    id: '',
    description: '',
    imageUrl: '',
    price: '',
    duration: '',
    from: '',
    to: '',
    createdAt: '',
    updatedAt: '',
    carId: '',
    isAssigned: false,
  );

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'duration': duration,
      'from': from,
      'to': to,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'carId': carId,
      'isAssigned': isAssigned,
    };
  }

  factory JourneyDestination.fromDocument(Map<String, dynamic> document) {
    return JourneyDestination(
      id: document['id'],
      description: document['description'],
      imageUrl: document['imageUrl'],
      price: document['price'],
      duration: document['duration'],
      from: document['from'],
      to: document['to'],
      createdAt: document['createdAt'],
      updatedAt: document['updatedAt'],
      carId: document['carId'],
      isAssigned: document['isAssigned'],
    );
  }
}
