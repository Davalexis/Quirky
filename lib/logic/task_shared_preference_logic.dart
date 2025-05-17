import 'package:shared_preferences/shared_preferences.dart';
import 'package:quirky/model/task_model.dart';
import 'dart:convert';

class TaskStorage {
  static const String _storagekey = 'tasks';

  /// load a list of tasks to shared preferences
  static Future<List<TaskModel>> loadTasks () async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_storagekey);
    if (jsonString == null) {return [];}
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<TaskModel> tasks =
        jsonList.map((json) => TaskModel.fromJson(json)).toList();
    return tasks;
  }

  /// save a list of tasks to shared preferences
 static  Future <void> saveTask (List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = json.encode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString(_storagekey, jsonString);
  }
}
