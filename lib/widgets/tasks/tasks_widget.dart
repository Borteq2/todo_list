import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/widgets/tasks/tasks_widget_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TasksWidgetModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TasksWidgetModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;
    if (model != null) {
      return TasksWidgetModelProvider(
        model: model,
        child: TasksWidgetBody(),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class TasksWidgetBody extends StatelessWidget {
  const TasksWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.watch(context)?.model;
    final title = model?.group?.name ?? 'Задачи';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _TasksListWidget(),
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
    final tasks = model.tasks[indexInList];
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
          title: Text(tasks.text),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}
