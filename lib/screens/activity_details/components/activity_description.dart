import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubung_4/model/activity.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ActivityDescription extends StatelessWidget {
  const ActivityDescription({
    Key? key,
    this.pressOnSeeMore, required this.activity,
  }) : super(key: key);

  // final Product product;
  final GestureTapCallback? pressOnSeeMore;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            activity.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(94),
            decoration: BoxDecoration(
              color:
                  // product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              true ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            // child: SvgPicture.asset(
            //   "assets/icons/Heart Icon_2.svg",
            //   color:
            //   true ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
            //
            //   // product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
            //   height: getProportionateScreenWidth(16),
            // ),
            child: Text(activity.type.toUpperCase(), style: TextStyle(color: Color(0xFFFF4848)),) ,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            activity.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child:  Row(
            children: [
              Text(
                activity.location,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: kPrimaryColor,
              ),

            ],
          ),

        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'Date: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Text(
                  activity.time.toString().substring(0,16),
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child:  Row(
            children: [
              Text(
                'Price: ',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
              SizedBox(width: 5),
              Text(
                activity.price.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),

            ],
          ),

        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child:  Row(
            children: [
              Text(
                'Max People: ',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
              SizedBox(width: 5),
              Text(
                activity.maxppl.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),

            ],
          ),

        ),

      ],
    );
  }
}
