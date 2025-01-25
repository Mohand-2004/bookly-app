import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksDetailsScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() cancelCommand;
  final void Function()? downloadCommand;
  const BooksDetailsScreenAppbar({super.key, required this.cancelCommand, this.downloadCommand});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: context.screenWidth,
      color: AppColors.transparent,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 18.w,),
      child: Row(
        children: [
          // cancel icon button
          GestureDetector(
            onTap: cancelCommand,
            child: Icon(
              Icons.close,
              color: AppColors.white,
              size: 25.r,
            ),
          ),

          // space 
          const Spacer(),

          // cart icon button
          downloadCommand == null ? const SizedBox() : GestureDetector(
            onTap: downloadCommand,
            child: Icon(
              Icons.download_rounded,
              color: AppColors.white,
              size: 25.r,
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => Size(double.infinity,65.h);
}