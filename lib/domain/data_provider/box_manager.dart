import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/domain/entities/group.dart';
import 'package:to_do_list/domain/entities/task.dart';

class BoxManager {

  // синглтон
  static final BoxManager instanse = BoxManager._();

  // приватный конструктор, чтобы нельзя было создать где-то ещё
  BoxManager._();

  Future<Box<Group>> openGroupBox() async {
    return _openBox('groups_box', 1, GroupAdapter());
  }

  Future<Box<Task>> openTaskBox(int groupKey) async {
    return _openBox(makeTaskBoxName(groupKey), 2, TaskAdapter());
  }

  Future<void> closeBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  String makeTaskBoxName(int groupKey) => 'tasks_box_$groupKey';

  Future<Box<T>> _openBox<T>(
      String name, int typeId, TypeAdapter<T> adapter) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }
}
