import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookly/core/extensions/context/media_query.dart';

class MySubAppbar extends StatelessWidget implements PreferredSize{
  final String title;
  final Widget? suffixIcon;
  final double fontSize;
  final void Function()? popCommand;
  final Color backgroundColor;
  final Color titleColor;
  const MySubAppbar({super.key,required this.title,this.suffixIcon,this.popCommand,this.fontSize = 25,this.backgroundColor = Colors.white,this.titleColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(context.screenWidth,50.h),
        child: Container(
          color: backgroundColor,
          margin: EdgeInsets.only(left: 10.w,top: 30.h),
          child: Row(
            children: [
              // back arrow
              Padding(
                padding: EdgeInsets.only(left: (Platform.isIOS ? 8 : 0).w),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                    if(popCommand != null){
                      popCommand!();
                    }
                  },
                  icon: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                    color: Colors.grey,
                    size: 25.r,
                  )
                ),
              ),
    
              // text
              Text(
                title,
                style: TextStyle(
                  fontSize: fontSize.r,
                  fontFamily: 'impact',
                  color: titleColor,
                ),
              ),

              // spacer
              const Spacer(),

              // suffix icon
              suffixIcon ?? const SizedBox(),

              // left space
              SizedBox(width: 15.w,),
            ],
          ),
        ),
      );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.infinity,50.h);
}