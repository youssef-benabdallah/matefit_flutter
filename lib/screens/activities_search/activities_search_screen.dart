import 'package:flutter/material.dart';
import 'package:ubung_4/screens/activities_search/components/body.dart';

class ActivitiesSearchScreen extends StatelessWidget {
  const ActivitiesSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result', style: TextStyle(color: Colors.black),),
        ),
        body: Body()
    );
  }
}
