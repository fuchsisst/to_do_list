import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/constans/todolist_constans.dart';
import 'package:to_do_list/database/database_todoList.dart';

class ToDoListCard extends StatefulWidget {
  const ToDoListCard({Key? key}) : super(key: key);

  @override
  _ToDoListCardState createState() => _ToDoListCardState();
}

class _ToDoListCardState extends State<ToDoListCard> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("ToDoList").snapshots(),
        builder: (context, snapshots) {
          return !snapshots.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshots.data!.docs[index];
                    return Dismissible(
                      onDismissed: (direction) {
                        deleteToDoList(data["todoTitle"]);
                        final snackBar = SnackBar(
                          content: Text('Task deleted!'),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      key: Key(data["todoTitle"]),
                      //the tasks widget begin
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 8.5,
                                ),
                                BoxShadow(
                                    color: Colors.black45,
                                    spreadRadius: 3.0,
                                    offset: const Offset(4, 3)),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              color: new Color(int.parse(
                                  data['todoColor']
                                      .split('(0x')[1]
                                      .split(')')[0],
                                  radix: 16))),
                          child: ListTile(
                              contentPadding: EdgeInsets.all(20),
                              leading: Icon(myIcons[data['todoIcon']],
                                  size: 60, color: Colors.grey[850]),
                              title: SizedBox(
                                height: 30,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    data['todoTitle'],
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              subtitle: SizedBox(
                                  height: 29,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      data['todoTask'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                              trailing: Transform.scale(
                                  scale: 1.8,
                                  child: IconButton(
                                      onPressed: () {
                                        deleteToDoList(data["todoTitle"]);
                                        final snackBar = SnackBar(
                                          content: Text('Task deleted!'),
                                          duration: Duration(seconds: 2),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      icon: Icon(Icons.delete_outline_outlined,
                                          color: Colors.grey[900]))))),
                      //the task widget end
                    );
                  },
                );
        });
  }
}
