import 'package:flutter/material.dart';

import 'package:ubung_4/screens/sign_in/components/body.dart';
import '../../size_config.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(

        body: Body()
    );}
}