import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ubung_4/screens/welcome_screen/create_activity.dart';

import 'maps.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(2, 172, 172, 100),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 1),
          child: Column(
            children: [
              Text("Hey Max, worauf hast du Lust",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(4),
                child: Text("123 Aktivitäten in deiner Nähe",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),

                  border: Border(
                    top: BorderSide(
                        width: 3,
                        color: Colors.grey,
                        style: BorderStyle.solid), //BorderSide
                    bottom: BorderSide(
                        width: 3,
                        color: Colors.grey,
                        style: BorderStyle.solid), //BorderSide
                    left: BorderSide(
                        width: 3,
                        color: Colors.grey,
                        style: BorderStyle.solid), //Borderside
                    right: BorderSide(
                        width: 3,
                        color: Colors.grey,
                        style: BorderStyle.solid), //BorderSide
                  ), //Border
                ), //BoxDecoration
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text("Alle"),
                    onPressed: () =>
                    {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (_) => Scaffold(
                          appBar: AppBar(title: Text("hello")),
                          body: LiteModePage(),
                        )))
                        }
                  ),
                  RaisedButton(
                    child: Text("Empfolen"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("Erstellen"),
                    onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateActivity()),
                        );
                    },
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: const Image(
                  width: 350,
                  image: NetworkImage(
                      'https://elcomercio.pe/resizer/b0C3GIL5rJYEDXsr6lWFe6av-qU=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/UAGOCODQDJDNRG7KSJ7Z3PTJ2E.jpg'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                      RaisedButton(
                        child: Text("Aktivitäten"),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text("In der Umgebung"),
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          RaisedButton(
                            child: Text("Anzahl Members"),
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          RaisedButton(
                            child: Text("Datum"),
                            onPressed: () {},
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          RaisedButton(

                            child: Text("Suchen"),
                            onPressed: () {},
                          ),
                        ])
                  ],
                ),
                decoration: const BoxDecoration(

                  border: Border(
                    top: BorderSide(
                        width: 2,
                        color: Colors.grey,
                        style: BorderStyle.solid), //BorderSide
                  ), //Border
                ), //BoxDecoration
              ),
            ],
          ),
        ),
      ),
    );
  }
}
