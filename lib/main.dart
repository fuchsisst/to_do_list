import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:to_do_list/pages/page_todolist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.orange,
      accentColor: Colors.orangeAccent,
    ),
    home: ToDoListPage(),
  ));
}
