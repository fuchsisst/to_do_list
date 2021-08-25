import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:to_do_list/constans/todolist_constans.dart';
import 'package:to_do_list/database/database_todoList.dart';
import 'todolist_colorchoose.dart';
import 'todolist_iconchoose.dart';

class ToDoLiSTDialog extends StatefulWidget {
  const ToDoLiSTDialog({Key? key}) : super(key: key);

  @override
  _ToDoLiSTDialogState createState() => _ToDoLiSTDialogState();
}

class _ToDoLiSTDialogState extends State<ToDoLiSTDialog> {
  DateTime _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormate = DateFormat('MMM dd, yyyy');

  _datePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormate.format(date);
    }
  }

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormate.format(_date);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      backgroundColor: Colors.grey[850],
      elevation: 0,
      scrollable: true,
      title: Align(
          alignment: Alignment.center,
          child: Text('Add a new To Do',
              style: TextStyle(color: Colors.orangeAccent))),
      content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        //Text input title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: TextField(
            style: TextStyle(color: Colors.grey[500]),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.orangeAccent),
                labelText: 'Title:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
            onChanged: (String value) {
              input = value;
            },
          ),
        ),
        //Text input task
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: TextField(
            style: TextStyle(color: Colors.grey[500]),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.orangeAccent),
                labelText: 'Task:',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            onChanged: (String value) {
              taskInput = value;
            },
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: TextFormField(
              style: TextStyle(color: Colors.orangeAccent),
              readOnly: true,
              onTap: _datePicker,
              controller: _dateController,
              decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(color: Colors.yellow),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            )),
        //Widget contains list of icons
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: SizedBox(
            height: 56,
            width: double.maxFinite,
            //List of icons
            child: IconChooseDialog(),
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              child: ColorChooseDialog(),
            )),
      ]),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              createToDoList();
              Navigator.of(context).pop();
            },
            child: Text('Save')),
      ],
    );
  }
}
