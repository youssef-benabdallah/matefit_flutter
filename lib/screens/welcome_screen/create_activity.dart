import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubung_4/db/activity_database.dart';
import 'package:ubung_4/global_variable.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/model/user.dart';

import 'package:ubung_4/screens/components/input_text.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



final titelController = TextEditingController();
final descriptionController = TextEditingController();
final locationController = TextEditingController();
final priceController = TextEditingController();
final maxPeopleController = TextEditingController();


InputText title = InputText(
    label: 'Title',
    hintText: 'Titel hier eingeben...',
    icon: Icon(Icons.eleven_mp_rounded),
    controller: titelController,
    isDigit: false,
    isMultiLine: false);

InputText description = InputText(
    label: 'Description',
    hintText: 'Description hier eingeben...',
    icon: Icon(Icons.groups),
    controller: descriptionController,
    isDigit: false,
    isMultiLine: true);

InputText location = InputText(
    label: 'Location',
    hintText: 'Location hier eingeben...',
    icon: Icon(Icons.groups),
    controller: locationController,
    isDigit: false,
    isMultiLine: false);

InputText price = InputText(
    label: 'Preis',
    hintText: 'Preis hier eingeben...',
    icon: Icon(Icons.groups),
    controller: priceController,
    isDigit: true,
    isMultiLine: false);

InputText maxPeople = InputText(
    label: 'Max People',
    hintText: 'Max People hier eingeben...',
    icon: Icon(Icons.groups),
    controller: maxPeopleController,
    isDigit: true,
    isMultiLine: false);

class CreateActivity extends StatefulWidget {
  const CreateActivity({Key? key}) : super(key: key);

  @override
  _CreateActivityState createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  Widget? getPriceWidget() {
    if (connectedUser.role=='trainer') {
      return price;
    }
  }

  Future<void> createActivity() async {

    var activity =   Activity(
      title: titelController.text,
      description: descriptionController.text,
      location: locationController.text,
      type: connectedUser.role == 'trainer'? 'event':'activity',
      price: connectedUser.role == 'trainer'? int.tryParse(priceController.text):0,
      maxppl: int.tryParse(maxPeopleController.text),
      time: _selectedDate,
    );

    try{
      final response = await http.post(Uri.parse('https://matefit-test.herokuapp.com/api/activity'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + userToken,

      },  body: {
        'title' : "Fußball",
        'description' : "Deutschland gegen Tunesien",
        'location' : "Oldenburger Straße 19, Berlin, Germany",
        'time' : "2023-06-20 17:03:41",
        'price' : '20',
        'maxppl' : "90",
          });

      switch (response.statusCode) {
        case 200:
          final msg = json.decode(response.body);
          print(msg);

          print(connectedUser.toString());

          break;
        case 401:
          print(json.decode(response.body));
          print('error');
          break;
        default:
          print(json.decode(response.body));
          break;
      }
    } on SocketException {
      print("Server error. Please retry");
    }
  }

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now().toLocal();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Aktivität erstellen'),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
          children: [
            Column(children: [
              title,

              location,
              if (true) ...{price},
              maxPeople,
              // The Row of selected Date & Time
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                //The Container of the Date in Form DD-MM-YYYY
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 40,
                  child: Text(
                      _selectedDate == null
                          ? 'Nothing has been picked yet'
                          : _selectedDate.toString().substring(0, 10),
                      style: TextStyle(fontSize: 20)),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                ),

                //The Container of the Date in Form HH:MM
                Container(
                  alignment: Alignment.center,
                  width: 75,
                  height: 40,
                  child: Text(_selectedTime.toString().substring(11, 16),
                      style: TextStyle(fontSize: 20)),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ]),

              //The Row to select Date & Time
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // The TextButton to select the Date from DatePicker
                TextButton(
                  child: Text('Select Date                                  '),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: _selectedDate == null
                                ? DateTime.now()
                                : _selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1))
                        .then((date) {
                      setState(() {
                        _selectedDate = date!;
                      });
                    });
                  },
                ),
                TextButton(
                    onPressed: () {
                      DatePicker.showTimePicker(context, showTitleActions: true,
                          onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        setState(() {
                          _selectedTime = date;
                        });
                      }, currentTime: _selectedTime, showSecondsColumn: false);
                    },
                    child: Text(
                      'Select Time',
                      style: TextStyle(color: Colors.blue),
                    )),
              ]),

              description,

              ElevatedButton(onPressed: () async {

                createActivity();
                 var activity =   Activity(
                    title: titelController.text,
                    description: descriptionController.text,
                    location: locationController.text,
                    type: connectedUser.role == 'trainer'? 'event':'activity',
                    price: connectedUser.role == 'trainer'? int.tryParse(priceController.text):0,
                   maxppl: int.tryParse(maxPeopleController.text),
                    time: _selectedDate,
                );
                    await ActivitiesDatabase.instance.createActivity(activity);

                 var listActivities = await ActivitiesDatabase.instance.readAllActivities();
                 for (int i= 0; i<listActivities.length;i++) {
                   print(listActivities[i].toString());
                 }

              }, child: Text("Submit"))
            ])
          ],
        ));
  }
}
