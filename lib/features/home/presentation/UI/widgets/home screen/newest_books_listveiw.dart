import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_details_screen.dart';
import 'package:bookly/features/home/presentation/UI/widgets/home%20screen/newest_item_container_widget.dart';
import 'package:flutter/material.dart';

class NewestBooksListveiw extends StatelessWidget {
  final List<Book> books;
  const NewestBooksListveiw({super.key,required this.books,});

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
          child: NewestItemContainerWidget(
            book: books[index],
          ),
        );
      }
    );
  }
}