import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/UI/widgets/no_more_books_data_widget.dart';
import 'package:bookly/core/extensions/context/media_query.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/UI/screens/book_details_screen.dart';
import 'package:bookly/features/home/presentation/logic/home%20featured%20books%20cubit/home_featured_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBooksPreveiwListveiw extends StatefulWidget {
  final List<Book> books;
  const HomeBooksPreveiwListveiw({super.key,required this.books,});

  @override
  State<HomeBooksPreveiwListveiw> createState() => _HomeBooksPreveiwListveiwState();
}

class _HomeBooksPreveiwListveiwState extends State<HomeBooksPreveiwListveiw> {
  late ScrollController _scrollController;
  int nextPageNumber = 1;
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >= 0.7 * _scrollController.position.maxScrollExtent) {
      if (!isloading){
        isloading = true;
        await context.read<HomeFeaturedBooksCubit>().getFeaturedBooks(
          nextPageNumber++
        );
        isloading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 260.r,
      child: ListView.builder(
        itemCount: widget.books.length + 1,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index){
          if (index == widget.books.length) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,),
              child: const NoMoreBooksDataWidget(),
            );
          }
          else{
            return GestureDetector(
              onTap: (){
                context.push(BookDetailsScreen(book: widget.books[index],));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.w,),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: AspectRatio(
                    aspectRatio: 2/3,
                    child: CachedNetworkImage(
                      imageUrl: widget.books[index].imageUrl ?? 'Error',
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