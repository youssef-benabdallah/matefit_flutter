import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/booking.dart';

class BookingsDatabase {
  static final BookingsDatabase instance = BookingsDatabase._init();

  static Database? _database;

  BookingsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mis.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableBookings ( 
  ${BookingFields.id} $idType, 
  ${BookingFields.title} $textType,
  ${BookingFields.description} $textType,
  ${BookingFields.location} $textType,
  ${BookingFields.time} $textType,
  ${BookingFields.status} $textType,
  ${BookingFields.participants} $integerType,
  ${BookingFields.price} $integerType
  )
''');
  }

  Future<Booking> createBooking(Booking booking) async {
    final db = await instance.database;

    final id = await db.insert(tableBookings, booking.toJson());
    return booking.copy(id: id);
  }

  Future<Booking> readBooking(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableBookings,
      columns: BookingFields.values,
      where: '${BookingFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Booking.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<Booking> readBookingFromAPI(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableBookings,
      columns: BookingFields.values,
      where: '${BookingFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Booking.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Booking>> readAllBookings() async {
    final db = await instance.database;

    final orderBy = '${BookingFields.time} ASC';
    final result = await db.query(tableBookings, orderBy: orderBy);

    //  or
    //     await db.rawQuery('SELECT * FROM $tableActivities ORDER BY $orderBy');

    return result.map((json) => Booking.fromJson(json)).toList();
  }

  Future<int> update(Booking booking) async {
    final db = await instance.database;

    return db.update(
      tableBookings,
      booking.toJson(),
      where: '${BookingFields.id} = ?',
      whereArgs: [booking.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableBookings,
      where: '${BookingFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
