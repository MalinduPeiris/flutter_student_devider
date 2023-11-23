
import 'package:flutter/material.dart';
import 'package:student_devide_app/group_maker.dart';

class MyContainner extends StatelessWidget {
  const MyContainner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('asstets\pexels-pixabay-159866.jpg'))
        ),
        child: Center(child:  GroupMaker()),
    );
  }
}