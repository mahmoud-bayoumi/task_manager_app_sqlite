import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../widgets/note_fields.dart';

class SqlDataBase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialdb();
      return _db;
    } else {
      return _db;
    }
  }

  initialdb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'Note');
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 9, onUpgrade: _onupgrade);
    return mydb;
  }

  _onupgrade(Database db, int oldversion, int newversion) async {
    // await db.execute("ALTER TABLE notes ADD COLUMN title TEXT ");
    // print('upgrade is action');
  }

  ondeletedatabase() async {
    String mydatapath = await getDatabasesPath();
    String path = await join(mydatapath, 'Note');
    await deleteDatabase(path);
  }

  _oncreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE ${NoteFields.tableName}(
      ${NoteFields.id} ${NoteFields.idType},
      ${NoteFields.title} ${NoteFields.textType},
      ${NoteFields.subtitle} ${NoteFields.textType},
      ${NoteFields.description} ${NoteFields.textType}
      )
      ''');
    await batch.commit();
    //print ("oncreate is action");
  }

  readData() async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery('''
           SELECT * FROM ${NoteFields.tableName}
         ''');
    return response;
  }

  deleteData(int id) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete('''
                    DELETE FROM ${NoteFields.tableName} WHERE ${NoteFields.id} =${id}
                    ''');
    return response;
  }

  insertData(String? title, String? subtitle, String? describtion) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert('''
                 INSERT INTO 'notes' ('title','subtitle','describ')  
                 VALUES ("$title ","$subtitle","$describtion" ) 
                ''');
    return response;
  }

  updataData(String title, String subtitle, String describtion, int id) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate('''
                 UPDATE ${NoteFields.tableName} SET ${NoteFields.title} = "${title}" ,
                 ${NoteFields.subtitle} = "$subtitle",
                 ${NoteFields.description} ="$describtion"
                  WHERE ${NoteFields.id}= "$id"
               ''');
    return response;
  }
}
