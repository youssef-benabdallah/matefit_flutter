import 'package:flutter/material.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/activity_details/components/body.dart';



class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({Key? key, required this.activity}) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details', style: TextStyle(color: Colors.black),),),
      body: Body(activity: activity,),
    );
  }
}
