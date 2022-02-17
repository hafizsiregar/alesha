import 'package:alesha/cubit/page_cubit.dart';
import 'package:alesha/pages/appointment_page.dart';
import 'package:alesha/pages/home_page.dart';
import 'package:alesha/pages/inbox_page.dart';
import 'package:alesha/pages/profile_page.dart';
import 'package:alesha/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainPage extends StatelessWidget {

  final GoogleSignInAccount? user;
  MainPage({required this.user});

  @override
  Widget build(BuildContext context) {

    Widget buildContent(int _currentIndex) {
      switch (_currentIndex) {
        case 0:
          return HomePage(user: user,);
        case 1:
          return AppointmentPage();
        case 2:
          return InboxPage();
        case 3:
          return ProfilePage(user: user,);
        default:
          return HomePage(user: user);
      }
    }

    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 64,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2
              ),
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomBottomNavigation(
                  imageUrl: 'images/ic_home.png', 
                  index: 0,
                ),
                CustomBottomNavigation(
                  imageUrl: 'images/ic_consult.png', 
                  index: 1
                ),
                CustomBottomNavigation(
                  imageUrl: 'images/ic_chat.png', 
                  index: 2
                ),
                CustomBottomNavigation(
                  imageUrl: 'images/ic_profile.png', 
                  index: 3
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, _currentIndex) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
              children: <Widget>[
              buildContent(_currentIndex),
              customBottomNav()
            ],
          ),
        );
      },
    );
  }
}
