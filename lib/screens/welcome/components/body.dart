import 'package:flutter/material.dart';
import 'package:ubung_4/screens/activities/activities_screen.dart';
import 'package:ubung_4/screens/activity_details/activity_details_screen.dart';
import 'package:ubung_4/screens/welcome/components/coustom_bottom_nav_bar.dart';
import 'package:ubung_4/screens/welcome_screen/activities.dart';
import 'package:ubung_4/screens/home/home_screen.dart';


import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  final Color inActiveIconColor = Color(0xFFB6B6B6);

  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: TabBarView(
        controller: _controller,
        children: [
          HomeScreen(),
          ActivitiesScreen(),
          Text("Calls"),
          Text("Calls"),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(controller: _controller),
    );
  }
}
