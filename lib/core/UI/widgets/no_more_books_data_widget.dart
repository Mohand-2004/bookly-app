import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoMoreBooksDataWidget extends StatelessWidget {
  const NoMoreBooksDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10.h,
      children: [
        Icon(
          Icons.sentiment_dissatisfied,
          size: 100.r,
          color: AppColors.white,
        ),

        Text(
          'No More Books',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}