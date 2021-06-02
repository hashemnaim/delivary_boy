import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class CustomSelectPhoto extends StatelessWidget {
  final File image;
  final Function onTap;

  const CustomSelectPhoto({this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: image == null ? 1 : 2,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? GestureDetector(
                onTap: () => onTap(),
                child: Container(
                  height: 62.h,
                  width: 97.w,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      width: 0.50.w,
                      color: blackOpacityColor,
                    ),
                    borderRadius: getBoarderRadius(18.00),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Color(0xff5e5e5e),
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.only(right: 10.w),
                height: 62.h,
                width: 97.w,
                decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      width: 0.50.w,
                      color: blackOpacityColor,
                    ),
                    borderRadius: getBoarderRadius(18.00),
                    image: DecorationImage(
                      image: FileImage(
                        image,
                      ),
                      fit: BoxFit.fill,
                    )),
              );
      },
    );
  }
}
