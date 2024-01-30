import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tin_flutter_book/common/entity/books.dart';

class DatabaseHelper {
  static const _databaseName = 'csg.db';
  static const _databaseVersion = 1;

  // Singleton instance to ensure a single database connection.
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static const _databaseTableShelf = 'DownloadBook';

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_databaseTableShelf (
            id INTEGER PRIMARY KEY,
            bookId TEXT NOT NULL,
            bookName TEXT NOT NULL,
            bookCover TEXT NOT NULL,
            encryptFilePath TEXT NOT NULL,
            filePath TEXT NOT NULL,
            downloadUrl TEXT NOT NULL,
            rawDownloadUrl TEXT ,
            isUpload TEXT NOT NULL,
            bookAuthor TEXT NOT NULL,
            fileFormat TEXT NOT NULL,
            value INTEGER
          )
        ''');
      },
    );
  }

  // 插入数据的方法
  Future<int> insertData(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('my_table', data);
  }

  // 插入图书
  Future<int> insertBookData(DownloadBook book) async {
    final db = await database;
    return await db.insert(_databaseTableShelf, book.toJson());
  }

// 更新数据的方法...
// 查询数据的方法...
// 删除数据的方法...
}