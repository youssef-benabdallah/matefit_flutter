import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ubung_4/helper/keyboard.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/activities_search/activities_search_screen.dart';
import 'package:ubung_4/screens/components/default_button.dart';
import 'package:http/http.dart' as http;


import '../../../global_variable.dart';

class ButtonsDown extends StatefulWidget {
  const ButtonsDown({Key? key}) : super(key: key);

  @override
  _ButtonsDownState createState() => _ButtonsDownState();
}

class _ButtonsDownState extends State<ButtonsDown> {

  @override
  bool _value = true;
  String dropdownValue = 'Activities';




  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment:  MainAxisAlignment.center, children: [
            DropdownButtonHideUnderline(child: DropdownButton(
                value: dropdownValue,
                items: <String>['Activities', 'Events']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value as String;
                  });
                }),),
            DropdownButton<String>(
              value: dropdownValue,
              dropdownColor: Colors.red,
              icon: const Icon(null),
              elevation: 16,
              isDense: false,
              style: const TextStyle(
                color: Colors.orange,
                backgroundColor: Color(0xFFFFECDF),
              ),
              underline: Container(
                height: 0.01,
                color: Colors.orange,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Activities', 'Events']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              width: 80,
            ),
            RaisedButton(
              child: Text("Nearby"),
              onPressed: () {},
            ),
            Switch(
              value: _value,
              onChanged: (bool value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RaisedButton(
              child: Text("Number of Members"),
              onPressed: () {},
            ),
            SizedBox(
              width: 50,
            ),
            RaisedButton(
              child: Text("Date"),
              onPressed: () {},
            ),
          ]),
          Container(
            width: 120,
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: DefaultButton(
                text: "Search",
                press: () {
                  KeyboardUtil.hideKeyboard(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ActivitiesSearchScreen()),
                  );


                  // Navigator.pushNamed(context, 'LoginSuccessScreen.routeName');
                }),
          )
        ],
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              width: 2,
              color: Colors.orange,
              style: BorderStyle.solid), //BorderSide
        ), //Border
      ), //BoxDecoration
    );
  }
}
