import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CRUD {
  late String path;
  late Database database;


//Constructor
  CRUD(String databaseName) {
    getLocation(databaseName);
  }

  // Get a location using getDatabasesPath
  getLocation(String databaseName) async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, databaseName);
  }

  // open the database
  startDatabase() async {
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    });
  }

  dropTable() async{
    await startDatabase();
    await database.execute('DROP TABLE Test');
    await closeDatabase();
  }
  // Insert record in a transaction
  Future<int> insertIntoDatabase(String request) async {
    late int id;
    await startDatabase();
    await database.transaction((txn) async {
      id = await txn.rawInsert(request);
    });
    await closeDatabase();
    return id;
  }

  //Get the records
  Future<List<Map>> selectFromDatabase(String request) async {
    await startDatabase();
    List<Map> list = await database.rawQuery(request);
    await closeDatabase();
    return list;
  }

  // Delete some records
  Future<int> deleteFromDatabase(String request) async {
    await startDatabase();
    int count = await database.rawDelete(request);
    // assert(count == 1);
    await closeDatabase();
    return count;
  }

  // Update some record
  Future<int> updateFromDatabase(String request) async {
    await startDatabase();
    int count = await database.rawUpdate(request);
    await closeDatabase();
    return count;
  }
// close Database
  closeDatabase() async {
    await database.close();
  }
}
