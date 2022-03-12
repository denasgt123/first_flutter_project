import 'package:first_flutter_project/main-screen.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/detailScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
