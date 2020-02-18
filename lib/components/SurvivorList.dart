import 'package:flutter/material.dart';
import '../services/api/survivors_service.dart';
import '../models/Survivor.dart';
import './SurvivorListTile.dart';

class SurvivorList extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            !snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final Survivor survivor = snapshot.data[index];
              return SurvivorListTile(
                name: survivor.name,
                age: survivor.age,
                gender: survivor.gender,
                infected: survivor.infected,
              );
            });
      },
      future: getSurvivors(),
    );
  }
}
