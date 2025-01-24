import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/UI/widgets/book_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewestItemContainerWidget extends StatelessWidget {
  final Book book;
  const NewestItemContainerWidget({super.key,required this.book,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: 133.h,
      margin: EdgeInsets.only(bottom: 23.h,),
      child: Row(
        children: [
          // book image
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: AspectRatio(
              aspectRatio: 2/3,
              child: CachedNetworkImage(
                imageUrl: book.imageUrl ?? 'Error',
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => Icon(
                  Icons.hide_image_rounded,
                  color: AppColors.white,
                  size: 40.r,
                ),
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
                  book.title,
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
                  book.authors,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                      book.price,
                      style: GoogleFonts.montserrat(
                        fontSize: 18.r,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    
                    // space
                    const Spacer(),
            
                    // book rating
                    BookRatingWidget(
                      book: book,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}