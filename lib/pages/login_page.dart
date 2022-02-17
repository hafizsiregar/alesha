import 'package:alesha/pages/main_page.dart';
import 'package:alesha/services/google_service.dart';
import 'package:alesha/themes/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future login() async {
    final user = await GoogleService.login();

    if(user == null) {
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Sign in Failed')));
    } else {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => 
    MainPage(user: user)));
    }
  }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 53),
              Center(
                child: Image.asset('images/ic_splash.png',
                height: 113,
                width: 130,
                fit: BoxFit.cover,
                color: kPrimaryColor),
              ),
              SizedBox(height: 13),
              Center(
                child: Text('Alesha',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor
                ),),
              ),
              SizedBox(height: 40),
              Text('Welcome back!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: kBlackColor
              ),),
              Text('sign in to continue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: kGreyColor
              ),),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  focusColor: Color(0xffF4F5F7),
                  fillColor: Color(0xffF4F5F7),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: 'johndoe@mail.com',
                  prefixIcon: Icon(Icons.email, color: kPrimaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  focusColor: Color(0xffF4F5F7),
                  fillColor: Color(0xffF4F5F7),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: '********',
                  prefixIcon: Icon(Icons.vpn_key_sharp, color: kPrimaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )
                ),
              ),
              SizedBox(height: 18),
              Align(
                alignment: Alignment.topRight,
                child: Text('Forgot Password?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor
                ),),
              ),
              SizedBox(height: 18),
              OutlinedButton(
                    onPressed: () {
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
                    child: Text('Sign in', style: whiteTextStyle),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: login,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: kPrimaryColor,
                              width: 2
                            ),
                          ),
                          child: Image.asset('images/ic_google.png',
                          width: 24,
                          height: 24,),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 2
                          ),
                        ),
                        child: Image.asset('images/ic_apple.png',
                        width: 24,
                        height: 24,),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 2
                          ),
                        ),
                        child: Image.asset('images/ic_fb.png',
                        width: 24,
                        height: 24,),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Do not have account?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),),
                      SizedBox(width: 5),
                      Text('Sign up!',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),),
                    ],
                  ),
                  SizedBox(height: 27)
            ],
          ),
        ),
      ),
    );
  }
}