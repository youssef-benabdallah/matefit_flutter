import 'package:flutter/material.dart';
import 'components/body.dart';

class ActivitiesScreen extends StatelessWidget {
  static String routeName = "/activities";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

}
