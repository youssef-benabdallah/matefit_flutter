import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/activities/components/activity_card.dart';
import 'package:ubung_4/screens/welcome_screen/activity_details.dart';
import '../../../global_variable.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Activity> activities = [];

  Future<void> getActivities() async {

    try {
      final response = await http.post(
          Uri.parse('https://matefit-test.herokuapp.com/api/search'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + userToken,
          },
          body: {
            // 'id' : '4',
            'title' : "workout im park",
            'plz': "Oldenburger Straße 19, Berlin, Germany",
          });

      switch (response.statusCode) {
        case 200:
          List temp = json.decode(response.body);
          for (int i = 0; i < temp.length; i++) {
            var activity = Activity(
                title: temp[i]['title'],
                description: temp[i]['description'],
                location: temp[i]['location'],
                type: temp[i]['type'],
                price: int.parse(temp[i]['price']),
                maxppl: temp[i]['maxppl'],
                time: DateTime.parse(temp[i]['time']));
            activities.add(activity);
            print(activities.length);
          }
          print('done 200');
          setState(() {
            activities;
          });
          break;
        case 401:
          print(json.decode(response.body));
          print('error 401');
          break;
        default:
          print('error else');
          print(json.decode(response.body));
          print('error else');

          break;
      }
    } on SocketException {
      print("Server error. Please retry");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActivityDetails(activities[index])),
                );
              },
              child: ActivityCard(activity: activities[index])),
        ),
      ),
    );
  }
}
