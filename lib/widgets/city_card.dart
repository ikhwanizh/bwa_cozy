import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/theme.dart';
import 'package:flutter_bwa_cozy/models/city.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                city.imageUrl,
                height: 102,
                width: 120,
                fit: BoxFit.cover,
              ),
              city.isPopular
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30))),
                        child: Center(
                            child: Image.asset(
                          'assets/icon_star.png',
                          height: 22,
                          width: 22,
                        )),
                      ),
                    )
                  : Container(),
            ]),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
