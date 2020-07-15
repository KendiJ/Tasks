import 'package:flutter/material.dart';
import 'package:my_tasks/Pages/profile.dart';
import 'package:my_tasks/Pages/Tasks/tasks.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MyProfile(),
          MyTasks(),
          // Todo(),
          // Progress(),
          // Done(),
        ]
      ),
    );
  }
}