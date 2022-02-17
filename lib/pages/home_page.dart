import 'package:alesha/pages/search_doctor_page.dart';
import 'package:alesha/themes/theme.dart';
import 'package:alesha/widgets/card_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  final List<String> imgList = [
    'images/img_1.png',
    'images/img_2.png',
    'images/img_3.png',
  ];

  final TextEditingController _searchController = TextEditingController();

  final GoogleSignInAccount? user;
  HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 105,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: <Widget>[
            Image.asset(
              'images/ic_splash.png',
              color: kPrimaryColor,
              height: 50,
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoUrl!),
              radius: 20,
            ),
          ],
        ),
      );
    }

    Widget hello() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hello, ${user!.displayName}'
            '\nWelcome to Alesha',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    Widget cardSlider() {
      return CarouselSlider(
        options: CarouselOptions(
            pauseAutoPlayOnTouch: true,
            height: 160,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 0.7,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800)),
        items: [
          CardSlider(imgUrl: imgList[0]),
          CardSlider(imgUrl: imgList[1]),
          CardSlider(imgUrl: imgList[2]),
        ],
      );
    }

    Widget textDoctor() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Top 3 Doctor',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchDoctorPage(query: '',),
                          ),
                        );
                      },
                      child: Text(
                        'Find Your Doctor',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
      );
    }

    Widget topDoctors() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 170,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:
                            Center(child: Image.asset('images/img_doctor.png')),
                      ),
                      SizedBox(height: 8),
                      Text('dr. John Doe')
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 170,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:
                            Center(child: Image.asset('images/img_doctor.png')),
                      ),
                      SizedBox(height: 8),
                      Text('dr. John Doe')
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 170,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:
                            Center(child: Image.asset('images/img_doctor.png')),
                      ),
                      SizedBox(height: 8),
                      Text('dr. John Doe')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget articles() {
      return Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25, left: 39, right: 29),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Artikel',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kWhiteColor),
                  ),
                  Text(
                    'Selengkapnya',
                    style: TextStyle(
                      fontSize: 14,
                      color: kWhiteColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 28),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 2, bottom: 2, right: 15),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 198,
                            width: 205,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2
                                ),
                              ],
                              color: kWhiteColor,
                              image: DecorationImage(
                                image: AssetImage('images/img_artikel1.png'),
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12, left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Manfaat Rutin Memakan\nBuah Setiap Hari',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: kBlackColor
                                  ),),
                                  SizedBox(height: 10),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 13,
                                        width: 61,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: kSecondaryColor
                                        ),
                                        child: Center(
                                          child: Text('Kesehatan',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: kWhiteColor
                                          ),),
                                        ),
                                      ), 
                                      SizedBox(width: 8),
                                      Container(
                                        height: 13,
                                        width: 61,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: kSecondaryColor
                                        ),
                                        child: Center(
                                          child: Text('Tips & Trik',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: kWhiteColor
                                          ),),
                                        ),
                                      ), 
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 18),
                          Container(
                            height: 198,
                            width: 205,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2
                                ),
                              ],
                              color: kWhiteColor,
                              image: DecorationImage(
                                image: AssetImage('images/img_artikel2.png'),
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5, left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Lakukan Hal ini Ketika\nSedang Stress',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: kBlackColor
                                  ),),
                                  SizedBox(height: 10),
                                  Row(  
                                    children: <Widget>[
                                      Container(
                                        height: 13,
                                        width: 61,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: kSecondaryColor
                                        ),
                                        child: Center(
                                          child: Text('Kesehatan',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: kWhiteColor
                                          ),),
                                        ),
                                      ), 
                                      SizedBox(width: 8),
                                      Container(
                                        height: 13,
                                        width: 61,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: kSecondaryColor
                                        ),
                                        child: Center(
                                          child: Text('Tips & Trik',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: kWhiteColor
                                          ),),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            header(),
            hello(),
            SizedBox(height: 23),
            cardSlider(),
            SizedBox(height: 23),
            textDoctor(),
            SizedBox(height: 10),
            topDoctors(),
            SizedBox(height: 23),
            articles()
          ],
        ),
      ),
    );
  }
}
