import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubung_4/routes.dart';
import 'package:ubung_4/screens/sign_in/sign_in_screen.dart';
import 'package:ubung_4/screens/welcome_screen/home_screen.dart';
import 'dart:io'; // for using HttpClient
import 'dart:convert'; // for using json.decode()
import 'package:http/http.dart' as http;
import 'package:ubung_4/theme.dart';



// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import './crud.dart';
// import 'package:sqfentity/sqfentity.dart';

// For Activity
import './model/activity.dart';
import './db/activity_database.dart';


void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      routes: routes,


    // home:   const HomeScreen(),
        home:   const SignInScreen(),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _fetchData() async {
    // const API_URL = 'https://jsonplaceholder.typicode.com/photos';
    //
    // HttpClient client = new HttpClient();
    // client.autoUncompress = true;
    //
    // final HttpClientRequest request = await client.getUrl(Uri.parse(API_URL));
    //
    // request.headers.
    //     set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    //
    // final HttpClientResponse response = await request.close();
    //
    // final String content = await response.transform(utf8.decoder).join();
    // final List data = json.decode(content);
    //
    // print(data);

try{
        final response = await http.post(Uri.parse('https://matefit-test.herokuapp.com/api/login'), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'


        },  body: {
          'email': 'kevin@matefit.com',
          'password': 'kevinkevin',
        });

        switch (response.statusCode) {
          case 200:
            print(json.decode(response.body));
            break;
          case 401:
            print(json.decode(response.body));
            break;
          default:
            print(json.decode(response.body));
            break;
        }
  } on SocketException {
  print("Server error. Please retry");
}



  }



  void connectToDatabaseTest() async {

    // Create a instance of Activity
    final activity = Activity(
        title: 'title',
        description: 'description',
        location: 'location',
        type: 'type',
        price: 5,
        maxppl: 10,
        time: DateTime.now(),
    );

    // insert the created Activity into activity table
    await ActivitiesDatabase.instance.createActivity(activity);

    // get all records of Activities
    List<Activity> listActivities = await ActivitiesDatabase.instance.readAllActivities();
    // print all of records
    for (int i= 0; i<listActivities.length;i++) {
      print(listActivities[i].toString());
    }

    //update the first record changing the title to 'Tennis'
    await ActivitiesDatabase.instance.update(listActivities[0].copy(title: 'Tennis'));

    //print all of records after update
    listActivities = await ActivitiesDatabase.instance.readAllActivities();
    for (int i= 0; i<listActivities.length;i++) {
      print(listActivities[i].toString());
    }

    //delete the record with id 3
    await ActivitiesDatabase.instance.delete(15);

    //print all of record after delete
    listActivities = await ActivitiesDatabase.instance.readAllActivities();
    for (int i= 0; i<listActivities.length;i++) {
      print(listActivities[i].toString());
    }

  }

  void _incrementCounter() async {
    _fetchData();
    connectToDatabaseTest();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    await prefs.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}