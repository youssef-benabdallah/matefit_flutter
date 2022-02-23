import 'package:flutter/material.dart';
import 'package:ubung_4/global_variable.dart';
import 'package:ubung_4/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static String routeName = "/welcome_screen";


  @override
  Widget build(BuildContext context) {
    print(userToken);
    return Body();
  }
}

