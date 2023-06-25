import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DetailsScreen()),
        // );
      },
      child: SvgPicture.asset(
        'assets/images/pregnancy.svg',
        // width: 120,
        // height: 120,
      ),
    );
  }
}
