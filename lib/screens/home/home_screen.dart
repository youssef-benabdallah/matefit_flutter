import 'package:flutter/material.dart';
import 'package:ubung_4/screens/home/components/buttons_down.dart';
import 'package:ubung_4/screens/home/components/google_maps.dart';

import '../../../size_config.dart';
import 'components/welcome_banner.dart';
import 'components/buttons_top.dart';



class HomeScreen extends StatelessWidget {

  static String routeName = "/home_screen";



  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeBanner(),
            ButtonsTop(),
            GoogleMaps(),
            SizedBox(height: getProportionateScreenWidth(10)),
            // PopularProducts(),
            // SizedBox(height: getProportionateScreenWidth(1)),
            ButtonsDown(),

          ],
        ),
      ),
    );
  }
}
