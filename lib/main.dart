import 'package:bookly/core/DI/main_di.dart';
import 'package:bookly/core/UI/screens/splash_screen.dart';
import 'package:bookly/features/home/presentation/logic/home%20featured%20books%20cubit/home_featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/logic/home%20newest%20books%20cubit/home_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  appInit();
  runApp(const BooklyApp());
}

void appInit() {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  initDI();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeFeaturedBooksCubit>(
            create: (context) => HomeFeaturedBooksCubit(getIt(),), 
          ),

          BlocProvider<HomeNewestBooksCubit>(
            create: (context) => HomeNewestBooksCubit(getIt(),), 
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}