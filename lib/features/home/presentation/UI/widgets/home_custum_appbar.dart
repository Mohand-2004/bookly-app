import 'package:bookly/core/UI/assets/app_assets.dart';
import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeCustumAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final void Function(String text) searchCommand;
  const HomeCustumAppbar({super.key, required this.height, required this.searchCommand});

  @override
  Widget build(BuildContext context){
    return Container(
      color: AppColors.transparent,
      height: height,
      width: context.screenWidth,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w,),
        child: Row(
          children: [
            // bookly logo image
            Image(
              height: (90 / 4.08).h,
              width: 90.w,
              image: const AssetImage(AppAssets.booklyLogo),
            ),
        
            // space between bookly logo and bookly text
            const Spacer(),
        
            // search icon
            Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: AppColors.white,
              size: 20.5.r,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}