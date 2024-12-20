import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home_custum_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      // appBar widget
      appBar: HomeCustumAppbar(
        height: 65.h,
        searchCommand: (text){
          // TODO: search book  
        },
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}