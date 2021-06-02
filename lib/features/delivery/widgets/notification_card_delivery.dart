import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class NotificationDeliveryCard extends StatelessWidget {
  Map map;
  NotificationDeliveryCard(this.map);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(68),
      width: ScreenUtil().setWidth(339),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setHeight(10),
      ),
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(20),
        right: ScreenUtil().setWidth(20),
        top: ScreenUtil().setHeight(10),
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 3.00),
            color: blackColor.withOpacity(0.16),
            blurRadius: 6,
          ),
        ],
        borderRadius: getBoarderRadius(18.00),
      ),
      child: Center(
        child: Text(
          map['status'] == '10' || map['status'] == '2'
              ? 'الطلب قيد التحضير'
              : map['status'] == '4' || map['status'] == '3'
                  ? 'الطلب تم تسليمه للمندوب'
                  : map['status'] == '5'
                      ? 'تم إلغاء الطلب من قبل المندوب'
                      : map['status'] == '6' || map['status'] == '7'
                          ? 'تم استلام الطلب للزبون'
                          : map['status'] == '8'
                              ? 'تم إلغاء الطلب من الزبون'
                              : 'لا يوجد',
          textAlign: TextAlign.right,
          style: getStyle(blackColor, FontWeight.normal, 18),
        ),
      ),
    );
  }
}
