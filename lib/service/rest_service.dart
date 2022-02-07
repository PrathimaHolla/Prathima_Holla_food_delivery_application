import 'package:fooddeliveryapplication/database/database_helper.dart';
import 'package:fooddeliveryapplication/models/restaurant.dart';
import 'package:scoped_model/scoped_model.dart';

class RestAuth extends Model{
  Future? addRest(restaurant,tableName) async {
    DatabaseHelper.instance.insert(restaurant.toMap(), tableName);
    // return await getRestId(tableName, restaurant);
  }
  // Future<int> getRestId(tableName,restaurant){
  //   return DatabaseHelper.instance.getRestId(tableName, restaurant);
  // }

  Future<List<Restaurant>> getAllRest() async{
    List<Restaurant> res=await DatabaseHelper.instance.getAllRest();
    for (var r in res) {
      print("id:"+r.restId.toString()+"\nname"+r.restName);
    }
    return res;
  }

  Future<int> getcountRest(tableName){
    return DatabaseHelper.instance.getCount(tableName);
  }
}