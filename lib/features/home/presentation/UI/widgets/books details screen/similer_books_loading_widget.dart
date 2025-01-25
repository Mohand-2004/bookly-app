import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SimilarBooksLoadingWidget extends StatelessWidget {
  const SimilarBooksLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 22.w,),
      itemBuilder: (context,index){
        return AspectRatio(
          aspectRatio: 2/3,
          child: Skeletonizer(
            child: Container(
              margin: EdgeInsets.only(right: 8.w,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r,),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/test.png'),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}