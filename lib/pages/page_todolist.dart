import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/widgets_custom/todolist_widgets/todolist_dialog.dart';
import 'package:to_do_list/widgets_custom/todolistwidget.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(18))),
          centerTitle: true,
          title: Text('To do list',
              style: TextStyle(fontSize: 25, color: Colors.grey[900])),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ToDoLiSTDialog();
                });
          },
          child: Icon(Icons.add),
        ),
        body: ToDoListCard());
  }
}
