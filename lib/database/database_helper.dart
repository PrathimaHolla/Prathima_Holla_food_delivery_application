import 'dart:io';
import 'package:fooddeliveryapplication/models/food_items.dart';
import 'package:fooddeliveryapplication/models/restaurant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper{
  static final _dbName='deliveryDB.db';
  static final _dbVersion=1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance=DatabaseHelper._privateConstructor();
  Database? _database;

  Future<Database?> get database async{
    if(_database!=null)
      return _database;
    _database=await _initiateDatabase();
    return _database;
  }

  _initiateDatabase () async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path=join(directory.path,_dbName);

    return await openDatabase(
      path,
      version:_dbVersion,
      onCreate:_onCreate
    );
  }
  
  Future? _onCreate(Database db, int version){
    db.execute(
      '''
      CREATE TABLE user(
        userId integer PRIMARY KEY NOT NULL,
        userName text not null,
        userPassword text not null
      )
      '''
    );

    db.execute(
      '''
      CREATE TABLE restaurant(
        restId integer PRIMARY KEY  NOT NULL,
        restName text not null,
        restPassword text not null
      )
      '''
    );
    
    db.execute(
      '''
        CREATE TABLE foodItems(
          foodId integer PRIMARY KEY  NOT NULL,
          foodName text not NULL,
          foodPrice real not null,
          restId integer not null
        )
      '''
    );

    db.execute(
      '''
        CREATE TABLE ORDERS(
          orderId integer PRIMARY KEY  NOT NULL,
          userId integer not null,
          restId integer not null,
          foodId integer not null
        )
      '''
    );
  }
  Future insert(Map<String,dynamic> row,String tableName) async{
    Database? db=await instance.database;
    await db?.insert(tableName,row);
    print("Inserted into table: "+tableName);
  }

  Future<List<Restaurant>> getAllRest() async{
    Database? db=await instance.database;
    List<Map<String,dynamic>> list=await db!.query('restaurant');
    List<Restaurant> res=[];
    list.forEach((element) {
      Restaurant restaurant=Restaurant(restId: element['restId'],restName: element['restName']);
      res.add(restaurant);
    });
    return res;
  }

  Future<int> getCount(tableName) async {
    int count=0;
   Database? db=await instance.database;
    List<Map<String,dynamic>> list=await db!.query(tableName);
    list.forEach((element) {
      count++;
    });
    return count;
  }

  Future<List<FoodItems>> getAllFood(restId) async{
    Database? db=await instance.database;
    List<Map<String,dynamic>> list=await db!.query('foodItem');
    List<FoodItems> res=[];
    list.forEach((element) {
      if(element['restId']==restId){
        FoodItems foodItems=FoodItems(restId: element['restId'],foodName: element['foodName'],foodPrice: element['foodPrice'],foodId: element['foodId']);
        res.add(foodItems);
      }
    });
    return res;
  }
  
}