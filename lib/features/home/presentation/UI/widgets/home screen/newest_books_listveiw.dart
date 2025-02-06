import 'package:bookly/core/UI/widgets/no_more_books_data_widget.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_details_screen.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/newest_item_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListveiw extends StatelessWidget {
  final List<Book> books;
  const NewestBooksListveiw({super.key,required this.books,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length + 1,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index){
        if (index == books.length) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            child: const NoMoreBooksDataWidget(),
          );
        }
        else{
          return GestureDetector(
            onTap: (){
              context.push(
                BookDetailsScreen(book: books[index],),
              );
            },
            child: NewestItemContainerWidget(
              book: books[index],
            ),
          );
        }
      }
    );
  }
}