import 'package:bookly/core/UI/widgets/no_more_books_data_widget.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_details_screen.dart';
import 'package:bookly/features/search/presentation/UI/widgets/search_widget_book_container.dart';
import 'package:bookly/features/search/presentation/logic/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultsListveiw extends StatelessWidget {
  final List<Book> books;
  const SearchResultsListveiw({super.key,required this.books,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length + 1,
      padding: EdgeInsets.zero,
      controller: context.read<SearchCubit>().scrollController,
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
            child: SearchWidgetBookContainer(
              book: books[index],
            ),
          );
        }
      }
    );
  }
}