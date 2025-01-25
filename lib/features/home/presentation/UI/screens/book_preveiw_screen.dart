import 'package:bookly/core/UI/style/app_colors.dart';
import 'package:bookly/core/UI/widgets/my_sub_appbar.dart';
import 'package:bookly/core/models/book_model.dart';
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
    controller.loadRequest(Uri.parse('https://flutter.dev'));
    print('o4');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      appBar: const MySubAppbar(
        title: '',
        backgroundColor: AppColors.darkPurple,
      ),

      body: WebViewWidget(controller: controller,),
    );
  }
}