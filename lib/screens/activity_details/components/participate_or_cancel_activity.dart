import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/components/default_button.dart';
import 'package:http/http.dart' as http;

import '../../../global_variable.dart';

class ParticipateOrCancelActivity extends StatefulWidget {
  const ParticipateOrCancelActivity({Key? key, required this.activityID})
      : super(key: key);

  final int? activityID;

  @override
  _ParticipateOrCancelActivityState createState() =>
      _ParticipateOrCancelActivityState();
}

class _ParticipateOrCancelActivityState
    extends State<ParticipateOrCancelActivity> {
  late Activity activity;
  String buttonTextValue = '';
  String apiAction = '';

  Future<void> getActivityByID() async {
    try {
      final response = await http.get(
          Uri.parse('https://matefit-test.herokuapp.com/api/activity/' +
              widget.activityID.toString()),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + userToken,
          });

      switch (response.statusCode) {
        case 200:
          var temp = json.decode(response.body);
          print(temp);

          List participants = temp['participants'];

          buttonTextValue = 'PARTICIPATE';
          apiAction = 'participate';
          if (participants.contains(connectedUser.id)) {
            buttonTextValue = 'CANCEL';
            apiAction = 'cancel';
          }
          setState(() {
            buttonTextValue;
            apiAction;
          });
          // activities = json.decode(response.body);
          print('done 200');
          // print(activities);
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

  Future<void> cancelOrParticipate() async {
    try {
      final response = await http.get(
          Uri.parse('https://matefit-test.herokuapp.com/api/activity/' +
              widget.activityID.toString() +
              apiAction),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + userToken,
          });

      switch (response.statusCode) {
        case 200:
          // if (apiAction == 'participate') {
          //   buttonTextValue = 'CANCEL';
          //   apiAction = 'cancel';
          // } else {
          //   buttonTextValue = 'PARTICIPATE';
          //   apiAction = 'participate';
          // }
          // setState(() {
          //   buttonTextValue;
          //   apiAction;
          // });
          getActivityByID();
          print('done 200');
          break;
        case 401:
          print(json.decode(response.body));
          print('error 401');
          break;
        default:
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
    getActivityByID();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: buttonTextValue,
      press: () {
        cancelOrParticipate();
      },
    );
  }
}
