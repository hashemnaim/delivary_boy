import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class CustomListTile extends StatelessWidget {
  final Function onTap;
  final String title;

  const CustomListTile({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
      trailing: Text(
        title,
        textAlign: TextAlign.right,
        style: getStyle(blackColor, FontWeight.normal, 20),
      ),
      leading: Icon(
        Icons.arrow_back_ios,
        color: blackColor,
        size: 18,
      ),
      onTap: onTap,
    );
  }
}
