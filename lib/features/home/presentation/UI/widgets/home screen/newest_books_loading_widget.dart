import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewestBooksLoadingWidget extends StatelessWidget {
  const NewestBooksLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index){
        return Skeletonizer(
          child: Container(
            width: context.screenWidth,
            height: 133.h,
            margin: EdgeInsets.only(bottom: 23.h,),
            child: Row(
              children: [
                // book image
                AspectRatio(
                  aspectRatio: 2/3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkPurple,
                      borderRadius: BorderRadius.circular(15.r),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/test.png') 
                      )
                    ),
                  ),
                ),

                // space 
                SizedBox(width: 30.w,),


                // book info column
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // book title
                      Text(
                        "Harry Potter and the Goblet of Fire",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 19.5.r,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                  
                      // space
                      SizedBox(height: 5.h,),
                  
                      // book author
                      Text(
                        "J.K. Rowling",
                        style: GoogleFonts.montserrat(
                          fontSize: 14.r,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white,
                        ),
                      ),

                      // space
                      SizedBox(height: 5.h,),

                      // book price and rating
                      Row(
                        children: [
                          // book price
                          Text(
                            "19.99 \$",
                            style: GoogleFonts.montserrat(
                              fontSize: 18.r,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          
                          // space
                          const Spacer(),
                  
                          // book rating
                          Row(
                            children: [
                              // star icon
                              Icon(
                                Icons.star_rounded,
                                color: Colors.yellow.shade500,
                              ),
                          
                              // space
                              SizedBox(width: 5.w,),
                          
                              // rating text
                              Text(
                                "4.5",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                          
                              // space
                              SizedBox(width: 5.w,),
                          
                              // rating count text
                              Text(
                                "(2390)",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.r,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}