import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({Key? key}) : super(key: key);

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Группы'),
      ),
      body: _GroupListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class _GroupListWidget extends StatefulWidget {
  const _GroupListWidget({Key? key}) : super(key: key);

  @override
  State<_GroupListWidget> createState() => _GroupListWidgetState();
}

class _GroupListWidgetState extends State<_GroupListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return _GroupListRowWidget(
          indexInList: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 1);
      },
    );
  }
}

class _GroupListRowWidget extends StatelessWidget {
  final int indexInList;

  const _GroupListRowWidget({
    Key? key,
    required this.indexInList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableBehindActionPane(),
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
          onTap: () {},
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
          title: Text('jklhrlkjshdrlk'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {

          },
        ),
      ),
    );
  }
}
