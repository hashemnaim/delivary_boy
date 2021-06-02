import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class NotificationCard extends StatelessWidget {
  final Map map;
  NotificationCard(this.map);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
        vertical: ScreenUtil().setHeight(10),
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
        borderRadius: getBoarderRadius(10.00),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
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
            style: getStyle(blackColor, FontWeight.normal, 16),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          // Container(
          //   height: ScreenUtil().setHeight(40),
          //   width: ScreenUtil().setWidth(40),
          //   decoration: BoxDecoration(
          //     color: orangeColor,
          //     shape: BoxShape.circle,
          //   ),
          // )
        ],
      ),
    );
  }
}
