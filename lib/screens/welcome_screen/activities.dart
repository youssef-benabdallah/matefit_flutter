import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubung_4/db/activity_database.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/components/activity_page.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {

  late List<Activity> listActivities = [];

  Future<void> getAllActivities() async {
    var tmpListActivity = await ActivitiesDatabase.instance.readAllActivities();

    setState(() {
      listActivities = tmpListActivity;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        for (int i = 0; i < listActivities.length; i++) ActivityPage(listActivities[i]),
        ElevatedButton(onPressed: getAllActivities, child: Text("123"))
      ],
    ));
  }
}
