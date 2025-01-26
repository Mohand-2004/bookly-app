import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/UI/widgets/my_sub_appbar.dart';
import 'package:bookly/core/extensions/context/navigation.dart';
import 'package:bookly/core/extensions/context/showing.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/services/url_lancher_service.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookPreveiwScreen extends StatefulWidget {
  final Book book;
  const BookPreveiwScreen({super.key, required this.book});

  @override
  State<BookPreveiwScreen> createState() => _BookPreveiwScreenState();
}

class _BookPreveiwScreenState extends State<BookPreveiwScreen> {
  WebViewController controller = WebViewController();
  @override
  void initState() {
    // controller.setJavaScriptMode(JavaScriptMode.unrestricted,);
    // controller.loadRequest(Uri.parse('https://flutter.dev'));
    super.initState();
    try{
      UrlLanchService.openUrl(widget.book.previewLink!);
      context.pop();
    }
    catch (e){
      context.showSnackBar(
        snackBar: const SnackBar(
          content: Text(
            "can't open preview link",
          ),
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkPurple,
      appBar: MySubAppbar(
        title: '',
        backgroundColor: AppColors.darkPurple,
      ),

      body: /*WebViewWidget(controller: controller,)*/SizedBox(),
    );
  }
}