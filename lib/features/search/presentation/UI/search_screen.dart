import 'package:bookly/core/DI/main_di.dart';
import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/UI/widgets/my_sub_appbar.dart';
import 'package:bookly/features/search/presentation/UI/widgets/search_feild.dart';
import 'package:bookly/features/search/presentation/UI/widgets/search_result_loading_widget_boosk.dart';
import 'package:bookly/features/search/presentation/UI/widgets/search_results_listveiw.dart';
import 'package:bookly/features/search/presentation/logic/search_cubit.dart';
import 'package:bookly/features/search/presentation/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt(),),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.darkPurple,
            appBar: const MySubAppbar(
              title: '',
              backgroundColor: AppColors.darkPurple,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // top space
                    SizedBox(height: 7.h,),
                
                    // search text feild
                    SearchFeild(
                      backgroundColor: AppColors.darkPurple,
                      textColor: AppColors.white,
                      focusedBorderColor: AppColors.white,
                      searchCommand: (value){
                        context.read<SearchCubit>().searchBooks(value,);
                      } 
                    ),
          
                    // space between widgets
                    SizedBox(height: 20.h,),
                
                    // result search text
                    BlocBuilder<SearchCubit,SearchState>(
                      builder: (context,state) => (state is SearchSucess) ? Text(
                        "Search Result",
                        style: GoogleFonts.montserrat(
                          fontSize: 14.r,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ) : const SizedBox.shrink(),
                    ),
          
                    // space between widgets
                    SizedBox(height: 20.h,),
          
                    // resu8lt search listview widget
                    Expanded(
                      child: SizedBox(
                        child: BlocBuilder<SearchCubit,SearchState>(
                          builder: (context,state){
                            if(state is SearchLoading){
                              return const SearchResultLoadingWidgetBoosk();
                            }
                            else if(state is SearchError){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 10.h,
                                children: [
                                  Icon(
                                    Icons.error_rounded,
                                    color: AppColors.white,
                                    size: 80.r,
                                  ),
                                  Text(
                                    'Search Error Failed',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18.r,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              );
                            }
                            else if (state is SearchSucess){
                              return SearchResultsListveiw(books: context.read<SearchCubit>().books,);
                            }
                            else{
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 10.h,
                                children: [
                                  Icon(
                                    Icons.search_rounded,
                                    color: AppColors.white,
                                    size: 80.r,
                                  ),
                                  Text(
                                    'Search Books',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18.r,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              );
                            }
                          } 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
