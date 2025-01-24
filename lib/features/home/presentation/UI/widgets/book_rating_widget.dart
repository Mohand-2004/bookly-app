import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookRatingWidget extends StatelessWidget {
  final Book book;
  const BookRatingWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          book.rating,
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
          '(${book.ratingCount})',
          style: GoogleFonts.montserrat(
            fontSize: 14.r,
            fontWeight: FontWeight.normal,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}