import 'package:flutter/material.dart';
import 'package:to_do_list/ui/widgets/group_form/group_form_widget.dart';
import 'package:to_do_list/ui/widgets/groups/groups_widget.dart';
import 'package:to_do_list/ui/widgets/task_form/task_form_widget.dart';
import 'package:to_do_list/ui/widgets/tasks/tasks_widget.dart';

abstract class MainNavigationRouteNames {
  static const groups = 'groups';
  static const groupsForm = '/groups/form';
  static const tasks = '/groups/tasks';
  static const tasksForm = '/groups/tasks/form';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.groups;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.groups: (context) => const GroupsWidget(),
    MainNavigationRouteNames.groupsForm: (context) => GroupFormWidget(),
    MainNavigationRouteNames.tasks: (context) => TasksWidget(),
    MainNavigationRouteNames.tasksForm: (context) => TaskFormWidget(),
  };
}
