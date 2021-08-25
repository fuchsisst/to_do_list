import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:to_do_list/constans/todolist_constans.dart';

//create collection
createToDoList() {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("ToDoList").doc(input);
  Map<String, String> todo = {
    "todoTitle": input,
    "todoTask": taskInput,
    "todoIcon": iconInput,
    "todoColor": colorInput,
  };
  documentReference.set(todo).whenComplete(() {
    print("$input created");
  });
}

//delete collection
deleteToDoList(item) {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("ToDoList").doc(item);
  documentReference.delete().whenComplete(() {
    print("$item deleted");
  });
}
