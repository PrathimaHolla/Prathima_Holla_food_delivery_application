import 'package:fooddeliveryapplication/database/database_helper.dart';
import 'package:fooddeliveryapplication/models/food_items.dart';
import 'package:scoped_model/scoped_model.dart';

class FoodAuth extends Model{
  Future? addFoodItem(foodItem,tableName) async {
    DatabaseHelper.instance.insert(foodItem.toMap(), tableName);
    // return await getRestId(tableName, restaurant);
  }
  // Future<int> getRestId(tableName,restaurant){
  //   return DatabaseHelper.instance.getRestId(tableName, restaurant);
  // }

  Future<List<FoodItems>> getAllFood(tableName,restId){
    return DatabaseHelper.instance.getAllFood(restId);
  }

  Future<int> getcountfoodItem(tableName){
    return DatabaseHelper.instance.getCount(tableName);
  }

  Future<int> getCountAll(tableName){
    return DatabaseHelper.instance.getCount(tableName);
  }
}