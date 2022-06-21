import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/models/tips.dart';
import 'package:flutter_bwa_cozy/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: Image.asset(tips.imageUrl, fit: BoxFit.cover),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(height: 4),
              Text(
                'Updated at ${tips.upadtedAt}',
                style: greyTextStyle,
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                color: greyColor,
              )),
        ],
      ),
    );
  }
}
