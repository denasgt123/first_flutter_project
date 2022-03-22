import 'package:first_flutter_project/done_tourism_place_list.dart';
import 'package:first_flutter_project/main_screen.dart';
import 'package:first_flutter_project/provider/done_tourism_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneTourismProvider(),
      child: MaterialApp(
        title: 'Contact',
        theme: ThemeData(),
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
