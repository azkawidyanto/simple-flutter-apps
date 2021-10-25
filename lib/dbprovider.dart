// import 'dart:io';
// import 'news.dart';
// import 'package:path/path.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DBProvider {
//   static Database _database;
//   static final DBProvider db = DBProvider._();

//   DBProvider._();

//   Future<Database> get database async {
//     // If database exists, return database
//     if (_database != null) return _database;

//     // If database don't exists, create one
//     _database = await initDB();

//     return _database;
//   }

//   // Create the database and the Employee table
//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'news.db');

//     return await openDatabase(path, version: 1, onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//       await db.execute('CREATE TABLE News('
//           'id INTEGER PRIMARY KEY,'
//           'keywords TEXT,'
//           'creator TEXT,'
//           'pubDate TEXT,'
//           'videourl TEXT,'
//           'description TEXT,'
//           'content TEXT,'
//           'imageurl TEXT,'
//           ')');
//     });
//   }

//   // Insert employee on database
//   createEmployee(ArticleModel newNews) async {
//     await deleteAllNews();
//     final db = await database;
//     final res = await db.insert('News', newNews);

//     return res;
//   }

//   // Delete all employees
//   Future<int> deleteAllNews() async {
//     final db = await database;
//     final res = await db.rawDelete('DELETE FROM News');

//     return res;
//   }

//   Future<List<ArticleModel>> getAllNews() async {
//     final db = await database;
//     final res = await db.rawQuery("SELECT * FROM News");

//     List list = res.isNotEmpty ? res.map((c) => News.fromJson(c)).toList() : [];

//     return list;
//   }
// }
