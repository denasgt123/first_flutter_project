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
      home: const DetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
