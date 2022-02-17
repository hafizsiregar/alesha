import 'dart:async';
import 'package:alesha/themes/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(Duration(seconds: 5),
    () => Navigator.pushNamedAndRemoveUntil(context, '/onBoard', (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          gradient: LinearGradient(
            colors: [
              kPrimaryColor,
              kSecondaryColor.withOpacity(0.7)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/ic_splash.png',
              height: 113,
              width: 130,
              fit: BoxFit.cover),
              SizedBox(height: 13),
              Text('Alesha',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white
              ),),
            ],
          ),
        ),
      ),
    );
  }
}