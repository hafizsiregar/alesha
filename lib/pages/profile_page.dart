import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({ Key? key, required this.user }) : super(key: key);

  final GoogleSignInAccount? user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  height: 210,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 3),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              user!.photoUrl!
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                user!.displayName!,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                user!.email,
                                style: TextStyle(),
                              )
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text('Keluar'),
                                      content:
                                          Text('Apakah anda yakin untuk keluar?'),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Batal',
                                              style: TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        CupertinoDialogAction(
                                          child: TextButton(
                                            onPressed: () async {
                                              await GoogleSignIn().signOut();
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()));
                                            },
                                            child: Text('Yakin'),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.exit_to_app,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.date_range_outlined),
                              SizedBox(height: 5),
                              Text('26 Tahun')
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.line_weight_outlined),
                              SizedBox(height: 5),
                              Text('50 kg')
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.height_outlined),
                              SizedBox(height: 5),
                              Text('160 cm')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 3),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.refresh),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        'Riwayat Konsultasi',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 3),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.backup_outlined),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        'Kelola Akun',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
            ],
          ),
    );
  }
}