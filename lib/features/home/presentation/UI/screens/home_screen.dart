import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/newest_books_listveiw.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/home_books_preveiw_listveiw.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/home_books_preveiw_loading_widget.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/home_custum_appbar.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/newest_books_loading_widget.dart';
import 'package:bookly/features/home/presentation/logic/home%20featured%20books%20cubit/home_featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/logic/home%20featured%20books%20cubit/states.dart';
import 'package:bookly/features/home/presentation/logic/home%20newest%20books%20cubit/home_newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/logic/home%20newest%20books%20cubit/states.dart';
import 'package:bookly/features/search/presentation/UI/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  int nextPageNumber = 1;
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >= 0.8 * _scrollController.position.maxScrollExtent) {
      if (!isloading){
        isloading = true;
        await context.read<HomeNewestBooksCubit>().getNewestBooks(
          nextPageNumber++
        );
        isloading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Builder(
      builder: (context){
        return Scaffold(
          backgroundColor: AppColors.darkPurple,
          // appBar widget
          appBar: HomeCustumAppbar(
            height: 65.h,
            searchCommand: (){
              context.push(
                const SearchScreen(),
              );
            },
          ),
        
          // body widget
          body: SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: Padding(
              padding: EdgeInsets.only(top: 38.h,left: 15.w,right: 15.w),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  // books preview listview widget
                  BlocBuilder<HomeFeaturedBooksCubit,HomeFeaturedBooksState>(
                    builder: (context,state){
                      if (state is FeaturedBooksLoadingState){
                        return const HomeBooksPreveiwLoadingWidget();
                      }
                      else if (state is FeaturedBooksErrorState){
                        return SizedBox(
                          width: context.screenWidth,
                          height: 260.r,
                          child: Center(
                            child: Text(
                              state.failure.message,
                              style: GoogleFonts.montserrat(
                                fontSize: 18.8.r,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                      else{
                        return HomeBooksPreveiwListveiw(
                          books: context.read<HomeFeaturedBooksCubit>().featuredBooks,
                        );
                      }
                    }
                  ),
        
                  // space between widgets
                  SizedBox(height: 45.h),
        
                  // best seller text widget
                  Text(
                    "Newest Books",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.8.r,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  // space between widgets
                  SizedBox(height: 15.h),
        
                  // best seller books listview widget
                  BlocBuilder<HomeNewestBooksCubit,HomeNewestBooksState>(
                    builder: (context,state){
                      if (state is NewsetBooksLoadingState){
                        return const NewestBooksLoadingWidget();
                      }
                      else if (state is NewsetBooksErrorState){
                        return Expanded(
                          child: SizedBox(
                            width: context.screenWidth,
                            child: Center(
                              child: Text(
                                state.failure.message,
                                style: GoogleFonts.montserrat(
                                  fontSize: 18.8.r,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      else{
                        return NewestBooksListveiw(
                          books: context.read<HomeNewestBooksCubit>().newestBooks, 
                        );
                      }
                    },
                  )
                ].map((widget) => SliverToBoxAdapter(child: widget)).toList(),
              ),
            ),
          ),
        );
      }
    );
  }
}