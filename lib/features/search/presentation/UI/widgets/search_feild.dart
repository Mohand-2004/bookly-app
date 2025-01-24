import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFeild extends StatefulWidget{
  final void Function(String value) searchCommand;
  final Color backgroundColor;
  final Color focusedBorderColor;
  final Color textColor;
  const SearchFeild({super.key,required this.searchCommand,this.backgroundColor = Colors.white,this.focusedBorderColor = Colors.blue,this.textColor = Colors.black,});
  @override
  State<SearchFeild> createState() => _SearchFeildState();
}

class _SearchFeildState extends State<SearchFeild>{
  bool searchAvailable = false;
  late Color backgroundColor;
  String text = '';
  @override
  void initState() {
    backgroundColor = widget.backgroundColor;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: widget.focusedBorderColor,
      cursorRadius: Radius.circular(20.r),
      cursorWidth: 3.sp,
      style: TextStyle(
        color: widget.textColor,
        fontSize: 16.r,
      ),
      onChanged: (value){
        text = value;
        widget.searchCommand(text);
        // enable search icon
        if(!searchAvailable && value != ''){
          setState(() {
            searchAvailable = true;
          });
        }
        // disable search icon
        else if(searchAvailable && value == ''){
          setState(() {
            searchAvailable = false;
          });
        }
      },
      onTap: (){
        setState((){
          backgroundColor = widget.backgroundColor;
        });
      },
      onTapOutside: (event){
        setState(() {
          backgroundColor = widget.backgroundColor;
        });
        // pop the keyboard when foucus outside
        // as in iOS the keboard won't pop automaticly
        if(Platform.isIOS){
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      onSubmitted: (value){
        if(value == ''){
          setState(() {
            backgroundColor = widget.backgroundColor;
          });
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
        border: InputBorder.none,
        filled: true,
        fillColor: backgroundColor,
        hintText: 'search',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.r,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: widget.focusedBorderColor,
            width: 2.r,
          ),
        ),
        suffixIcon: searchAvailable ? Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: IconButton(
            onPressed: (){
              widget.searchCommand(text);
            },
            icon: Icon(
              Icons.search_rounded,
              size: 20.r,
              color: widget.focusedBorderColor,
            ),
          ),
        ) : Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Icon(
            Icons.search_rounded,
            size: 20.r,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}