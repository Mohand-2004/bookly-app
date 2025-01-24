import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:flutter/material.dart';

class TwoColorContainerText extends StatelessWidget {
  final String text1;
  final String text2;
  final double height;
  final double raduis;
  final double fonstSized;
  final double width;
  final void Function() action1;
  final void Function() action2;
  const TwoColorContainerText({super.key,required this.action1,required this.action2,this.text1 = '',this.text2 = '',this.height = 50,this.raduis = 25,this.fonstSized = 16,this.width = -1,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width == -1 ? context.screenWidth : width,
      child: Row(
        children: [
          // price widget
          Expanded(
            child: GestureDetector(
              onTap: action1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(raduis,),
                    bottomLeft: Radius.circular(raduis,),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  text1,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: fonstSized,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: action2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.orangeRedPink,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(raduis,),
                    bottomRight: Radius.circular(raduis,),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  text2,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: fonstSized,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}