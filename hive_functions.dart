import 'package:hive_crud_app/const_data.dart';
import 'package:hive_flutter/adapters.dart';

class HiveFunctions{

  static final userBox = Hive.box(userHiveBox);

  static createUser(Map data){
    userBox.add(data);
  }

  static List getAllUsers(){
    final data = userBox.keys.map((key){
      final value = userBox.get(key);
      return {"key": key, "name":value["name"], "email": value["email"]};
    }).toList();

    return data.reversed.toList();
  }

  static updateUser(int key, Map data){
    userBox.put(key, data);
  }

  static deleteUser(int key){
    return userBox.delete(key);
  }

  static deleteAllUser(){
    return userBox.deleteAll(userBox.keys);
  }

}