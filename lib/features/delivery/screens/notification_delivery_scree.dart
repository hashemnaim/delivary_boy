import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/features/delivery/widgets/notification_card_delivery.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class NotificationDeliveryScreen extends StatelessWidget {
  ApiGet apiGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(180),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                  ),
                  child: Text(
                    "تنبيهات الطلبات ",
                    textAlign: TextAlign.right,
                    style: getStyle(blackColor, FontWeight.w700, 20),
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return apiGet.notificationMap.isEmpty
                        ? loading()
                        : apiGet.notificationMap['purchase'].length == 0
                            ? Center(
                                child: Text('لا يوجد إشعارات'),
                              )
                            : ListView.builder(
                                itemCount:
                                    apiGet.notificationMap['purchase'].length,
                                itemBuilder: (context, index) {
                                  return NotificationDeliveryCard(apiGet
                                      .notificationMap['purchase'][index]);
                                },
                              );
                  }),
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: ScreenUtil().setHeight(100),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: true,
                    iconTheme: IconThemeData(color: blackColor),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
