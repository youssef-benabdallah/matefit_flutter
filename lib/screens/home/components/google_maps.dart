import 'package:flutter/material.dart';

class GoogleMaps extends StatelessWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.orangeAccent,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(1),
      child: const Image(
        width: 350,
        image: NetworkImage(
            'https://elcomercio.pe/resizer/b0C3GIL5rJYEDXsr6lWFe6av-qU=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/UAGOCODQDJDNRG7KSJ7Z3PTJ2E.jpg'),
      ),
    );
  }
}
