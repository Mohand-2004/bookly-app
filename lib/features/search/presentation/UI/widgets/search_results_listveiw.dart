import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_details_screen.dart';
import 'package:bookly/features/search/presentation/UI/widgets/search_widget_book_container.dart';
import 'package:flutter/material.dart';

class SearchResultsListveiw extends StatelessWidget {
  final List<Book> books;
  const SearchResultsListveiw({super.key,required this.books,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index){
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
    );
  }
}