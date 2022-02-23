import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubung_4/screens/welcome_screen/create_activity.dart';

import '../../../size_config.dart';

class ButtonsTop extends StatelessWidget {
  const ButtonsTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": Icon(
          Icons.select_all,
          color: Colors.orange,
        ),
        "text": "All",
        "press": null
      },
      {
        "icon": Icon(
          Icons.recommend,
          color: Colors.orange,
        ),
        "text": "Recommended",
        "press": null
      },
      {
        "icon": Icon(
          Icons.create,
          color: Colors.orange,
        ),
        "text": "Create",
        "press": null
      },
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateActivity()),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final Icon? icon;
  final String? text;

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            InkWell(
                onTap: press,
                highlightColor: Colors.black,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  transformAlignment: AlignmentDirectional.center,
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  height: getProportionateScreenWidth(55),
                  width: getProportionateScreenWidth(55),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: icon!,
                )),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
