import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/UI/widgets/my_sub_appbar.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_details_screen.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/newest_item_container_widget.dart';
import 'package:bookly/features/search/presentation/UI/widgets/search_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  print(value);
                } 
              ),

              // space between widgets
              SizedBox(height: 20.h,),
          
              // result search text
              Text(
                "Search Result",
                style: GoogleFonts.montserrat(
                  fontSize: 14.r,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),

              // space between widgets
              SizedBox(height: 20.h,),

              // resu8lt search listview widget
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          // context.push(
                            // TODO pass book object model
                            // const BookDetailsScreen(),
                          // );
                        },
                        // child: const NewestItemContainerWidget(),
                      );
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
}
