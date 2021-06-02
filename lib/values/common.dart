import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery_boy/services/firebase_chat.dart';
import 'package:delivery_boy/services/time/timeago.dart';
import 'package:delivery_boy/values/color.dart';
 
getBoarderRadius(double radius) {
  return BorderRadius.circular(radius);
}

getStyle(Color color, FontWeight fontWeight, double fontSize) {
  return GoogleFonts.almarai(
    textStyle: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    ),
  );
}

getSheetError(String title) {
  return Get.snackbar(
    '',
    '',
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: getStyle(redColor, FontWeight.normal, 16),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Icon(
          Icons.info,
          color: redColor,
        ),
      ],
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: whiteColor,
  );
}

getSheetSucsses(String title) {
  return Get.snackbar(
    '',
    '',
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: getStyle(blueColor, FontWeight.normal, 16),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Icon(
          Icons.check,
          color: blueColor,
        ),
      ],
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: whiteColor,
  );
}

loading() {
  return Center(child: CircularProgressIndicator());
}

updateStatusUser(String muId, String state) {
  FireBaseHelper.fireBaseHelper
      .updateUser(muId, state, DateTime.now().toString());
}

String parseHumanDateTime(String datetime) {
  var timeAgo = DateTime.now().difference(DateTime.parse(datetime));
  var theDifference = DateTime.now().subtract(timeAgo);

  return  format(theDifference, locale: 'ar');
}
