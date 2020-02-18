import 'package:flutter/material.dart';

class SurvivorListTile extends StatelessWidget {
  SurvivorListTile(
      {@required this.name,
      @required this.age,
      @required this.gender,
      @required this.infected});

  final String name;
  final int age;
  final String gender;
  final bool infected;

  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(5),
        title: Text(name),
        subtitle: Text("$age years old - $gender"),
        trailing: Icon(Icons.directions_run,
            color: infected ? Colors.red : Colors.green));
  }
}
