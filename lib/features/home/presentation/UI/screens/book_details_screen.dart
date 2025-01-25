import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/domain/home_repo.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_preveiw_screen.dart';
import 'package:bookly/core/UI/widgets/book_rating_widget.dart';
import 'package:bookly/features/home/presentation/UI/widgets/books%20details%20screen/books_details_screen_appbar.dart';
import 'package:bookly/features/home/presentation/UI/widgets/books%20details%20screen/similar_books_listveiw.dart';
import 'package:bookly/features/home/presentation/UI/widgets/books%20details%20screen/similer_books_loading_widget.dart';
import 'package:bookly/features/home/presentation/UI/widgets/books%20details%20screen/two_color_container_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  const BookDetailsScreen({super.key,required this.book,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      appBar: BooksDetailsScreenAppbar(
        cancelCommand: (){
          context.pop();
        },
        downloadCommand: book.canBeDownloaded ? (){

        } : null,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // top space
          SizedBox(height: 5.h,),

          // books image widget
          Center(
            child: Container(
              width: (context.screenWidth > 500 ? 120 : 140).w,
              height: 190.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r,),
                image: book.hasImage? DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(book.imageUrl!,),
                ) : null,
              ),
              child: !book.hasImage ? Icon(
                Icons.hide_image_rounded,
                color: AppColors.white,
                size: 40.r,
              ) : null,
            ),
          ),

          // space between widgets
          SizedBox(height: 20.h,),

          // book title text widget
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              book.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 25.r,
                fontWeight: FontWeight.w700
              ),
            ),
          ),

          // space between widgets
          SizedBox(height: 5.h,),

          // book author text widget 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              book.authors,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                fontSize: 14.r,
                fontWeight: FontWeight.normal,
                color: AppColors.white,
              ),
            ),
          ),

          // space between widgets
          SizedBox(height: 15.h,),

          // book rating widget 
          Row(
            children: [
              const Spacer(),
              BookRatingWidget(book: book,),
              const Spacer(),
            ],
          ),


          // space between widgets
          SizedBox(height: 15.h,),


          // book price widget
          TwoColorContainerText(
            height: 42.h,
            width: context.screenWidth - 76.w,
            text1: book.price,
            text2: book.canBePreviewd ?  'Free Preview' : 'No Preview',
            raduis: 15.r,
            fonstSized: 16.r,
            action1: (){
              // TODO open download page link webveiw page
            },
            action2: (){
              if (book.canBePreviewd){
                context.push(
                  BookPreveiwScreen(book: book,)
                );
              }
            },
          ),
           
          // space between widgets
          SizedBox(height: 18.h,),

          // suggested books text widget
          Row(
            children: [
              SizedBox(width: 22.w,),
              Text(
                'You can also like',
                style: GoogleFonts.montserrat(
                  fontSize: 16.r,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
            ],
          ),


          // space between widgets
          SizedBox(height: 10.h,),

          // suggested books listview widget
          Expanded(
            child: SizedBox(
              child: FutureBuilder(
                future: HomeRepo.getSimilarBooks(book,),
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    return SimilarBooksListveiw(books: snapshot.data!,);
                  }
                  else if (snapshot.hasError){
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 16.r,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    );
                  }
                  else{
                    return const SimilarBooksLoadingWidget();
                  }
                },
              ),
            ),
          ),

          // bottom space
          SizedBox(height: 10.h,)
        ],
      ),
    );
  }
}

