import 'package:fooddeliveryapplication/database/database_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class UserAuth extends Model{
  Future? addUser(user,tableName){
    DatabaseHelper.instance.insert(user.toMap(), tableName);
  }

  Future<int> getcountUser(tableName){
    return DatabaseHelper.instance.getCount(tableName);
  }

}