import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/theme.dart';

class FacilitiesItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  FacilitiesItem(
      {required this.imageUrl, required this.name, required this.total});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: '$total',
            style: TextStyle(
                color: purpleColor, fontSize: 16, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                  text: ' $name', style: greyTextStyle.copyWith(fontSize: 14))
            ])),
      ],
    );
  }
}
