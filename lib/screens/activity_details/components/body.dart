import 'package:flutter/material.dart';
import 'package:ubung_4/model/activity.dart';
import 'package:ubung_4/screens/activity_details/components/participate_or_cancel_activity.dart';
import 'package:ubung_4/screens/components/default_button.dart';

import '../../../size_config.dart';
import 'activity_description.dart';
import 'color_dots.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.activity}) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ActivityDescription(
                pressOnSeeMore: () {},
                activity: activity,
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: ParticipateOrCancelActivity(
                            activityID: activity.id),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
