import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/models/city.dart';
import 'package:flutter_bwa_cozy/models/space.dart';
import 'package:flutter_bwa_cozy/models/tips.dart';
import 'package:flutter_bwa_cozy/providers/space_provider.dart';
import 'package:flutter_bwa_cozy/theme.dart';
import 'package:flutter_bwa_cozy/widgets/bottom_navbar.dart';
import 'package:flutter_bwa_cozy/widgets/city_card.dart';
import 'package:flutter_bwa_cozy/widgets/space_card.dart';
import 'package:flutter_bwa_cozy/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            //NOTE: HEADER
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: POPULAR CITIES
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Popular Cities',
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/jakarta.png',
                        isPopular: false),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/bandung.png',
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/surabaya.png',
                        isPopular: false),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            //NOTE: RECOMMENDED SPACE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Recommended Space',
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpace(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;
                    int index = 0;
                    return Column(
                        children: data.map((item) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                          top: index == 1 ? 0 : 30,
                        ),
                        child: SpaceCard(item),
                      );
                    }).toList());
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: TIPS & GUIDANCE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Tips & Guidance',
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                TipsCard(Tips(
                    id: 1,
                    imageUrl: 'assets/tips1.png',
                    title: 'City Guidelines',
                    upadtedAt: '20 Apr')),
                SizedBox(
                  height: 20,
                ),
                TipsCard(Tips(
                    id: 2,
                    imageUrl: 'assets/tips2.png',
                    title: 'Jakarta Trip',
                    upadtedAt: '2 Apr')),
              ],
            ),
            SizedBox(
              height: 50 + (24 * 2),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
