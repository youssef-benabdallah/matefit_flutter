import 'package:flutter/material.dart';
import 'package:ubung_4/screens/components/rounded_icon_btn.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 4;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: [
            ...List.generate(
              // product.colors.length,
              4,

              (index) => ColorDot(
                // color: product.colors[index],
                color: Colors.red,

                isSelected: index == selectedColor,
              ),
            ),
            Spacer(),
            SizedBox(width: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(70),
        width: getProportionateScreenWidth(70),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_960_720.png'),
        ));
  }
}
