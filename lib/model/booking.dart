final String tableBookings = 'bookings';

class BookingFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, location, time, status, participants, price
  ];

  static final String id = 'id';
  static final String title = 'title';
  static final String description = 'description';
  static final String location = 'location';
  static final String time = 'time';
  static final String status = 'status';
  static final String participants = 'participants';
  static final String price = 'price';
}

class Booking {
  final int? id;
  final String title;
  final String description;
  final String location;
  final DateTime time;
  final String status;
  final String participants;
  final int? price;

  const Booking({
    this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.time,
    required this.status,
    required this.participants,
    required this.price,
  });

  Booking copy({
    int? id,
    String? title,
    String? description,
    String? location,
    DateTime? time,
    String? status,
    String? participants,
    int? price,
  }) =>
      Booking(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        location: location ?? this.location,
        time: time ?? this.time,
        status: status ?? this.status,
        participants: participants ?? this.participants,
        price: price ?? this.price,
      );

  static Booking fromJson(Map<String, Object?> json) => Booking(
    id: json[BookingFields.id] as int?,
    title: json[BookingFields.title] as String,
    description: json[BookingFields.description] as String,
    location: json[BookingFields.location] as String,
    time: DateTime.parse(json[BookingFields.time] as String),
    status: json[BookingFields.status] as String,
    participants: json[BookingFields.participants] as String,
    price: json[BookingFields.price] as int?,
  );

  String toString() => (BookingFields.id + ': ' +
      id.toString() + ',' +
      BookingFields.title + ': ' +
      title + ',' +
      BookingFields.description + ': ' +
      description + ',' +
      BookingFields.location + ':  ' +
      location);

  Map<String, Object?> toJson() => {
    BookingFields.id: id,
    BookingFields.title: title,
    BookingFields.description: description,
    BookingFields.location: location,
    BookingFields.time: time.toIso8601String(),
    BookingFields.status: status,
    BookingFields.participants: participants,
    BookingFields.price: price,
  };
}
