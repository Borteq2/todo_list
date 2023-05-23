import 'package:flutter/material.dart';
import 'package:to_do_list/domain/data_provider/box_manager.dart';
import 'package:to_do_list/domain/entities/task.dart';

class TaskFormWidgetModel {
  var taskText = '';
  int groupKey;

  TaskFormWidgetModel({
    required this.groupKey,
  });

  void saveTasks(BuildContext context) async {
    if (taskText.isEmpty) return;

    final task = Task(text: taskText, isDone: false);
    final box = await BoxManager.instanse.openTaskBox(groupKey);
    await box.add(task);
    await BoxManager.instanse.closeBox(box);
    Navigator.of(context).pop();
  }
}

class TaskFormWidgetModelProvider extends InheritedWidget {
  final TaskFormWidgetModel model;

  const TaskFormWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static TaskFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskFormWidgetModelProvider>();
  }

  static TaskFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskFormWidgetModelProvider>()
        ?.widget;
    return widget is TaskFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(TaskFormWidgetModelProvider old) {
    return false;
  }
}
