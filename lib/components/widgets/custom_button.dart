import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final int width;
  final Color colorButton;

  CustomButton({this.title, this.onTap, this.width = 335, this.colorButton});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: colorButton == null ? orangeColor : colorButton,
          borderRadius: getBoarderRadius(20.h),
          border: colorButton == null
              ? null
              : Border.all(width: 2, color: orangeColor),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: getStyle(
              colorButton == null ? whiteColor : orange2Color,
              FontWeight.w700,
              20,
            ),
          ),
        ),
      ),
    );
  }
}
