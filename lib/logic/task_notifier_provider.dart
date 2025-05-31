import 'package:quirky/logic/task_shared_preference_logic.dart';
import 'package:quirky/model/task_model.dart';
import 'package:riverpod/riverpod.dart';

final taskListProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref,) {
  return TaskNotifier();
});


class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    loadTasks ();
  }

  ///Load task from storage
  Future<void> loadTasks() async {
    final tasks = await TaskStorage.loadTasks();
    state = tasks;
  }

  ///Add a task to the list
  void addTask(String title ,{bool isSomeDay = false}) {
    final newTask = TaskModel(
      title: title,
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      isSomeDay: isSomeDay ? 'someday' : 'today',
    );
    state = [...state,  newTask];
    TaskStorage.saveTask(state);
  }


  ///Update a task in the list
  void toggleTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;

    }).toList();
    TaskStorage.saveTask(state);
  }


  ///Delete all completed tasks from the list
  void deleteTask (String id) {
    state = state.where((task) => task.id != id).toList();
    TaskStorage.saveTask(state);
  }


  



}
