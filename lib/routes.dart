import 'package:flutter/widgets.dart';
import 'package:ubung_4/screens/welcome/welcome_screen.dart';
import 'package:ubung_4/screens/welcome_screen/home_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),


};
