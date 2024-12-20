import 'package:bookly/core/UI/assets/app_assets.dart';
import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/features/home/presentation/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController textAnimationController;
  late Animation<Offset> textAnimation; 
  @override
  void initState(){
    initTextAnimation();
    super.initState();
    navigateToHomeScreen();
  }

  Future<void> navigateToHomeScreen() async {
      await Future.delayed(
      const Duration(seconds: 2),(){
        // ignore: use_build_context_synchronously
        context.pushAndRemoveUntil(
          const HomeScreen(),
        );
      }
    );
  }

  void initTextAnimation() {
    textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    textAnimation = Tween<Offset>(
      begin: const Offset(0,4),
      end: Offset.zero,
    ).animate(textAnimationController);
    
    textAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // bookly logo image
          Image(
            width: 235.w,
            height: (235 / 4.08).h,
            image: const AssetImage(AppAssets.booklyLogo), 
          ),

          // space between bookly logo and bookly text
          SizedBox(height: 15.h),

          // bookly animated text
          AnimatedBuilder(
            animation: textAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: textAnimation,
                child: Text(
                  "Read Free Books",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}