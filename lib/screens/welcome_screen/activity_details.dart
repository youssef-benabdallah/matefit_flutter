import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/components/activity_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      print('Could not launch ${uri.toString()}');
    }
  }
}

class ActivityDetails extends StatefulWidget {
  Activity activity;
  ActivityDetails(this.activity, {Key? key}) : super(key: key);

  @override
  _ActivityDetailsState createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.activity.title),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(widget.activity.description ,
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(""),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.activity.time.toString().substring(0,16),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.w900)),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("Im Kalendar eintragen")),
                    ]),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    onPressed: () {
                      MapUtils.navigateTo(1, 2);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text(widget.activity.location)
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: Row(
                          children: [
                            Icon(Icons.favorite),
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [Text("Teilnehmen")],
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 2,
                          color: Colors.grey,
                          style: BorderStyle.solid), //BorderSide
                    ), //Border
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        width: 200,

                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border(

                            top: BorderSide(
                                width: 2,
                                color: Colors.grey,
                                style: BorderStyle.solid),
                            bottom: BorderSide(
                                width: 2,
                                color: Colors.grey,
                                style: BorderStyle.solid),
                            left: BorderSide(
                                width: 2,
                                color: Colors.grey,
                                style: BorderStyle.solid),
                            right: BorderSide(
                                width: 2,
                                color: Colors.grey,
                                style: BorderStyle.solid),
                            //BorderSide
                          ), //Border
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.groups,
                              size: 30,
                            ),
                            Text(
                              "Teilnehmer",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.account_circle),
                              Text("Teilnehmer 1"),
                              Text(""),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
