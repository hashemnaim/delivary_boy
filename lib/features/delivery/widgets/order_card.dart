import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
 
class OrderCard extends StatelessWidget {
  Map map;
  OrderCard(this.map);
  @override
  Widget build(BuildContext context) {
     return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
        vertical: ScreenUtil().setHeight(10),
      ),
      height: 50.h,
      width: 339.w,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 3.00),
            color: blackColor.withOpacity(0.16),
            blurRadius: 6,
          ),
        ],
        borderRadius: getBoarderRadius(10.00),
      ),
      child: Text(
        map['status'] == '10' || map['status'] == '2'
            ? 'تم الموافقة علي الطلب'
            : map['status'] == '4'
                ? 'تم تسليمه للديلفري'
                : map['status'] == '5' || map['status'] == '8'
                    ? 'طلب ملغي'
                    : map['status'] == '6' ||
                            map['status'] == '7' ||
                            map['status'] == '9'
                        ? "طلب منجز"
                        : map['status'] == '3'
                            ? 'طلب تم تحضيره'
                            : "",
        textAlign: TextAlign.right,
        style: getStyle(blackColor, FontWeight.normal, 16),
      ),
    );
  }
}
