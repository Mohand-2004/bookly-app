import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBooksPreveiwListveiw extends StatelessWidget {
  final List<Book> books;
  const HomeBooksPreveiwListveiw({super.key,required this.books,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 260.r,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              context.push(BookDetailsScreen(book: books[index],));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: AspectRatio(
                  aspectRatio: 2/3,
                  child: CachedNetworkImage(
                    imageUrl: books[index].imageUrl ?? 'Error',
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Icon(
                      Icons.hide_image_rounded,
                      color: AppColors.white,
                      size: 40.r,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}



// Container(
//               margin: EdgeInsets.only(right: 10.w,),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: AppColors.transparent,
//                 borderRadius: BorderRadius.circular(25.r),
//                 image: books[index].hasImage ? DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(books[index].imageUrl!,),
//                 ) : null,
//               ),
//               child: !books[index].hasImage ? Icon(
//                 Icons.hide_image_rounded,
//                 color: AppColors.white,
//                 size: 40.r,
//               ) : null,
//             ),