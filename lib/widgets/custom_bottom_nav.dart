import 'package:alesha/cubit/page_cubit.dart';
import 'package:alesha/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigation extends StatelessWidget {

  final String imageUrl;
  final int index;

  CustomBottomNavigation({
    required this.imageUrl, 
    required this.index, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Container(
        width: 25,
        height: 27,
        child: Image.asset(imageUrl,
        color: context.read<PageCubit>().state == index 
        ? kPrimaryColor : Colors.grey[400],
        fit: BoxFit.cover),
      ),
    );
  }
}