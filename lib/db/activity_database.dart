import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/activity.dart';

class ActivitiesDatabase {
  static final ActivitiesDatabase instance = ActivitiesDatabase._init();

  static Database? _database;

  ActivitiesDatabase._init();

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
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableActivities ( 
  ${ActivityFields.id} $idType, 
  ${ActivityFields.title} $textType,
  ${ActivityFields.description} $textType,
  ${ActivityFields.location} $textType,
  ${ActivityFields.type} $textType,
  ${ActivityFields.price} $integerType,
  ${ActivityFields.maxppl} $integerType,
  ${ActivityFields.time} $textType
  )
''');
  }

  Future<Activity> createActivity(Activity activity) async {
    final db = await instance.database;

    final id = await db.insert(tableActivities, activity.toJson());
    return activity.copy(id: id);
  }

  Future<Activity> readActivity(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableActivities,
      columns: ActivityFields.values,
      where: '${ActivityFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Activity.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Activity>> readAllActivities() async {
    final db = await instance.database;

    final orderBy = '${ActivityFields.time} ASC';
    final result = await db.query(tableActivities, orderBy: orderBy);

    //  or
    //     await db.rawQuery('SELECT * FROM $tableActivities ORDER BY $orderBy');

    return result.map((json) => Activity.fromJson(json)).toList();
  }

  Future<int> update(Activity activity) async {
    final db = await instance.database;

    return db.update(
      tableActivities,
      activity.toJson(),
      where: '${ActivityFields.id} = ?',
      whereArgs: [activity.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableActivities,
      where: '${ActivityFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
