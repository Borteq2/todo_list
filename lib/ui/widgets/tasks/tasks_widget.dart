import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/ui/widgets/tasks/tasks_widget_model.dart';

class TasksWidgetConfiguration {
  final int groupKey;
  final String title;

  TasksWidgetConfiguration({
    required this.groupKey,
    required this.title,
  });
}

class TasksWidget extends StatefulWidget {
  final TasksWidgetConfiguration configuration;

  const TasksWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  late final TasksWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = TasksWidgetModel(configuration: widget.configuration);
  }

  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: _model,
      child: const TasksWidgetBody(),
    );
  }

  @override
  void dispose() async{
    await _model.dispose();
    super.dispose();
  }
}

class TasksWidgetBody extends StatelessWidget {
  const TasksWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.watch(context)?.model;
    final title = model?.configuration.title ?? 'Задачи';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const _TasksListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model?.showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TasksListWidget extends StatelessWidget {
  const _TasksListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksCount =
        TasksWidgetModelProvider.watch(context)?.model.tasks.length ?? 0;
    return ListView.separated(
      itemCount: tasksCount,
      itemBuilder: (BuildContext context, int index) {
        return _TasksListRowWidget(
          indexInList: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
    );
  }
}

class _TasksListRowWidget extends StatelessWidget {
  final int indexInList;

  const _TasksListRowWidget({
    Key? key,
    required this.indexInList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.read(context)!.model;
    final task = model.tasks[indexInList];

    final icon = task.isDone ? Icons.done : null;
    final style =
        task.isDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null;

    return Slidable(
      actionPane: const SlidableBehindActionPane(),
      // actions: <Widget>[
      //   IconSlideAction(
      //     caption: 'Archive',
      //     color: Colors.blue,
      //     icon: Icons.add_a_photo,
      //     onTap: () {},
      //   ),
      //   IconSlideAction(
      //     caption: 'Archive',
      //     color: Colors.green,
      //     icon: Icons.back_hand,
      //     onTap: () {},
      //   ),
      // ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => model.deleteTask(indexInList),
        ),
        // IconSlideAction(
        //   caption: 'Archive',
        //   color: Colors.brown,
        //   icon: Icons.branding_watermark,
        //   onTap: () {},
        // ),
      ],
      child: ColoredBox(
        color: Colors.white,
        child: ListTile(
          title: Text(
            task.text,
            style: style,
          ),
          trailing: Icon(icon),
          onTap: () => model.doneToggle(indexInList),
        ),
      ),
    );
  }
}
