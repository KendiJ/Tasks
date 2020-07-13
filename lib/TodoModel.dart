import 'package:flutter/widgets.dart';
import 'package:my_tasks/TaskModel.dart';
// This contains a task list of all the tasks given by the user.
class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = []; // contains all the task

  addTaskInList() {
    TaskModel taskModel = TaskModel("title ${taskList.length}", "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}