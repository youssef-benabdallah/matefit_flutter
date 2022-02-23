final String tableActivities = 'activities';

class ActivityFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, location, type, price, maxppl, time
  ];

  static final String id = 'id';
  static final String title = 'title';
  static final String description = 'description';
  static final String location = 'location';
  static final String type = 'type';
  static final String price = 'price';
  static final String maxppl = 'maxPeople';
  static final String time = 'time';
}

class Activity {
  final int? id;
  final String title;
  final String description;
  final String location;
  final String type;
  final int? price;
  final int? maxppl;
  final DateTime time;

  const Activity({
    this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.type,
    required this.price,
    required this.maxppl,
    required this.time,
  });

  Activity copy({
    int? id,
    String? title,
    String? description,
    String? location,
    String? type,
    int? price,
    int? maxppl,
    DateTime? time,
  }) =>
      Activity(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        location: location ?? this.location,
        type: type ?? this.type,
        price: price ?? this.price,
        maxppl: maxppl ?? this.maxppl,
        time: time ?? this.time,
      );

  static Activity fromJson(Map<String, Object?> json) => Activity(
        id: json[ActivityFields.id] as int?,
        title: json[ActivityFields.title] as String,
        description: json[ActivityFields.description] as String,
        location: json[ActivityFields.location] as String,
        type: json[ActivityFields.type] as String,
        price: json[ActivityFields.price] as int?,
        maxppl: json[ActivityFields.maxppl] as int,
        time: DateTime.parse(json[ActivityFields.time] as String),
      );

  String toString() => (ActivityFields.id +
      ': ' +
      id.toString() +
      ',' +
      ActivityFields.title +
      ': ' +
      title +
      ',' +
      ActivityFields.description +
      ': ' +
      description +
      ',' +
      ActivityFields.location +
      ':  ' +
      location);

  Map<String, Object?> toJson() => {
        ActivityFields.id: id,
        ActivityFields.title: title,
        ActivityFields.description: description,
        ActivityFields.location: location,
        ActivityFields.type: type,
        ActivityFields.price: price,
        ActivityFields.maxppl: maxppl,
        ActivityFields.time: time.toIso8601String(),
      };
}
