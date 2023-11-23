import 'package:flutter/material.dart';
import 'package:student_devide_app/my_container.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body:  MyContainner(),
      ),
    );
  }
}