import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeBooksPreveiwLoadingWidget extends StatelessWidget {
  const HomeBooksPreveiwLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 260.r,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return AspectRatio(
            aspectRatio: 2/3,
            child: Skeletonizer(
              child: Container(
                margin: EdgeInsets.only(right: 10.w,),
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/test.png') 
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}