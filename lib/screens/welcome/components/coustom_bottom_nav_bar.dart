import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubung_4/screens/welcome_screen/home_screen.dart';
// import 'package:shop_app/screens/profile/profile_screen.dart';

import '../../../constants.dart';
import '../../../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return TabBar(

      padding: EdgeInsets.symmetric(vertical: 10),
      // labelStyle: ,
      controller: controller,
      indicatorColor: kPrimaryColor,
      unselectedLabelColor: inActiveIconColor,
      labelColor: kPrimaryColor,
      indicatorWeight: 0.01,

      indicatorSize: TabBarIndicatorSize.label,
      tabs: const [
        Tab(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
        ),
        Tab(
          icon: Icon(Icons.groups, size: 40),
        ),
        Tab(
          icon: Icon(Icons.message, size: 40),
        ),
        Tab(
          icon: Icon(Icons.account_circle, size: 40),
        ),
      ],
    );
  }
}
