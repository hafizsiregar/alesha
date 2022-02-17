import 'package:alesha/pages/login_page.dart';
import 'package:alesha/pages/main_page.dart';
import 'package:alesha/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {

  int _currentPage = 0;
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

   setCurrentPage(int value) {
    _currentPage = value;
    setState(() { 
    });
  }    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 960,
              child: PageView(
                controller: _pageController,
                allowImplicitScrolling: true,
                children: <Widget>[
                  header1(),
                  header2(),
                  header3(),
                ],
                onPageChanged: (value) => {setCurrentPage(value)},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                3,
                (index) => getIndicator(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (_currentPage == pageNo) ? 10 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (_currentPage == pageNo) ? kPrimaryColor : kWhiteColor),
    );
  }

  Widget header1() {
    return Column(
      children: <Widget>[
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome to Alesha', style: blackTextStyle),
              SizedBox(height: 22),
              Text(
                'Reference site about Lorem',
                style: secondBlackTextStyle,
              ),
              SizedBox(height: 2),
              Text(
                'Ipsum, giving information origins',
                style: secondBlackTextStyle,
              ),
              SizedBox(height: 2),
              Text(
                'as well as a random',
                style: secondBlackTextStyle,
              ),
            ],
          ),
        ),
        Image.asset('images/img_on_board1.png')
      ],
    );
  }

  Widget header2() {
    return Column(
      children: <Widget>[
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Find Best Doctors', style: blackTextStyle),
              SizedBox(height: 22),
              Text(
                'Reference site about Lorem',
                style: secondBlackTextStyle,
              ),
              SizedBox(height: 2),
              Text(
                'Ipsum, giving information origins',
                style: secondBlackTextStyle,
              ),
              SizedBox(height: 2),
              Text(
                'as well as a random',
                style: secondBlackTextStyle,
              ),
            ],
          ),
        ),
        SizedBox(height: 104),
        Image.asset('images/img_on_board2.png')
      ],
    );
  }

  Widget header3() {
    return Column(
      children: <Widget>[
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Get Fitness Trips', style: blackTextStyle),
              SizedBox(height: 22),
              Text(
                'Reference site about Lorem',
                style: secondBlackTextStyle,
              ),
              SizedBox(height: 2),
              Text(
                'Ipsum, giving information origins',
                style: secondBlackTextStyle,
              ),
              SizedBox(height: 2),
              Text(
                'as well as a random',
                style: secondBlackTextStyle,
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                    LoginPage()));
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                    fixedSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
                  ),
                  child: Text('Continue', style: whiteTextStyle),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 104),
        Image.asset('images/img_on_board3.png'),
      ],
    );
  }
}
