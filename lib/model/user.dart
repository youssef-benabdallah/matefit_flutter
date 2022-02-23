final String tableUsers = 'users';

class UserFields {
  static final List<String> values = [
    /// Add all fields
    id, name, lastname, bDate, gender, role, email, price, credit, password, dicipline
  ];

  static final String id = 'id';
  static final String name = 'name';
  static final String lastname = 'lastname';
  static final String bDate = 'bDate';
  static final String gender = 'gender';
  static final String role = 'role';
  static final String email = 'email';
  static final String price = 'price';
  static final String credit = 'credit';
  static final String password = 'password';
  static final String dicipline = 'dicipline';
}

class User {
  final int? id;
  final String name;
  final String lastName;
  final String? bDate;
  final String gender;
  final String role;
  final String email;
  final int? price;
  final int? credit;
  final String? password;
  final String dicipline;

  const User({
    this.id,
    required this.name,
    required this.lastName,
    required this.bDate,
    required this.gender,
    required this.role,
    required this.email,
    required this.price,
    required this.credit,
    required this.password,
    required this.dicipline,
  });

  User copy({
    int? id,
    String? name,
    String? lastName,
    String? bDate,
    String? gender,
    String? role,
    String? email,
    int? price,
    int? credit,
    String? password,
    String? diciplin,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        bDate: bDate ?? this.bDate,
        gender: gender ?? this.gender,
        role: role ?? this.role,
        email: email ?? this.email,
        price: price ?? this.price,
        credit: credit ?? this.credit,
        password: password ?? this.password,
        dicipline: diciplin ?? this.dicipline,

      );

  static User fromJson(Map<String, Object?> json) => User(
    id: json[UserFields.id] as int?,
    name: json[UserFields.name] as String,
    lastName: json[UserFields.lastname] as String,
    bDate: json[UserFields.bDate] as String,
    gender: json[UserFields.gender] as String,
    role: json[UserFields.role] as String,
    email: json[UserFields.email] as String,
    price: json[UserFields.price] as int?,
    credit: json[UserFields.credit] as int?,
    password: json[UserFields.password] as String?,
    dicipline: json[UserFields.dicipline] as String,
  );

  String toString() => (UserFields.id + ': ' +
      id.toString() + ',' +
      UserFields.name + ': ' +
      name + ',' +
      UserFields.lastname + ': ' +
      lastName + ',' +
      UserFields.email + ':  ' +
      email);

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.name: name,
    UserFields.lastname: lastName,
    UserFields.bDate: bDate,
    UserFields.gender: gender,
    UserFields.role: role,
    UserFields.email: email,
    UserFields.price: price,
    UserFields.credit: credit,
    UserFields.password: password,
    UserFields.dicipline: dicipline,
  };
}
