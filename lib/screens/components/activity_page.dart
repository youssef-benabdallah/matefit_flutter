import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/welcome_screen/activity_details.dart';
import 'package:ubung_4/screens/welcome_screen/home_screen.dart';

class ActivityPage extends StatefulWidget {
  Activity activity;

  ActivityPage(this.activity,{Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {


  _ActivityPageState() ;

  bool _value = true;



  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityDetails(widget.activity)),
        );      },

      child: Center(

        child: Container(

          decoration: const BoxDecoration(

            border: Border(

              bottom: BorderSide(
                  width: 2,
                  color: Colors.orange,
                  style: BorderStyle.solid), //BorderSide
            ), //Border
          ),
          //color: Color.fromRGBO(2, 172, 172, 100),
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
          child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sports_baseball),
                    Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(widget.activity.title),
                          Text(widget.activity.description.substring(0,6)),
                          Text(widget.activity.time.toString().substring(0,6)),
                        ]),
                    Spacer(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.groups),
                              Text(" 3 "),
                              Icon(Icons.message),
                              Text(" 2"),


                            ],
                          ),
                          Text(""),
                          Row(
                            children: [
                              Icon(Icons.location_on_rounded),
                              Text(widget.activity.location.substring(0,6)),
                            ],
                          ),

                        ]),
                  ],

                ),
              ]
          ),
        ),
      ),
    );
  }
}
