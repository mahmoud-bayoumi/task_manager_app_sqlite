import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDataBase{
  static Database? _db;

  Future<Database?> get db async{
    if(_db ==null){
      _db=  await initialdb();
      return _db;}
    else{
      return _db;
    }
  }

  initialdb ()async{
    String databasepath= await getDatabasesPath();
    String path=join(databasepath,'Notpad');
    Database mydb= await openDatabase(path,
        onCreate: _oncreate,version: 6,onUpgrade: _onupgrade);
    return mydb;
  }

  _onupgrade(Database db,int oldversion,int newversion)async{
   // await db.execute("ALTER TABLE notes ADD COLUMN title TEXT ");
    print('upgrade is action');
  }

  ondeletedatabase() async{
    String mydatapath=await getDatabasesPath();
    String path=await join(mydatapath,'Notpad');
    await deleteDatabase(path);

  }

  _oncreate(Database db,int version)async{
    Batch batch=db.batch();
    batch.execute(
        '''
      CREATE TABLE notes(
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      subtitle TEXT NOT NULL,
      describ TEXT NOT NULL
      )
      '''
    );
    await batch.commit();
    print ("oncreate is action");

  }
  readData(String sql)async{
    Database? mydb=await db;
    List<Map> response=await mydb!.rawQuery(sql);
    return response;
  }
  deleteData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawDelete(sql);
    return response;
  }
  insertData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawInsert(sql);
    return response;
  }
  updataData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawUpdate(sql);
    return response;
  }

}

