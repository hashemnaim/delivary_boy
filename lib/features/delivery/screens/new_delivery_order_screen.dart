import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/features/delivery/screens/my_order_map_screen.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class NewOrderDeliveryScreen extends StatelessWidget {
  ApiGet apiGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: Text("طلباتك",  style: getStyle(
                                              Colors.white, FontWeight.w300, 20),
                                        ),
        centerTitle: true,
      ),
        backgroundColor: whiteColor,
        body: Stack(
          children: [
         
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(
                //   height: ScreenUtil().setHeight(180),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: ScreenUtil().setWidth(20),
                //   ),
                //   child: Text(
                //     "تنبيهات الطلبات ",
                //     textAlign: TextAlign.right,
                //     style: getStyle(blackColor, FontWeight.w700, 20),
                //   ),
                // ),
                Expanded(
                  child: Obx(() {
                    return apiGet.notAcceptdeliveryOrderMap.length == 0
                        ? Center(
                            child: Text('لا يوجد طلبات جديدة',style: getStyle(
                                              Colors.black, FontWeight.w300, 20),),
                          )
                        : ListView.builder(
                            itemCount: apiGet.notAcceptdeliveryOrderMap.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  apiGet.setindexList(
                                      apiGet.notAcceptdeliveryOrderMap[index]);

                                  Get.to(MyOrderMapScreen());
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.h,
                                      left: 15.w,
                                      right: 15.w,
                                      bottom: 10.h),
                                  child: Container(
                                    height: 70.h,
                                    width: 338.w,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.00, 3.00),
                                          color: blackColor.withOpacity(0.16),
                                          blurRadius: 6,
                                        ),
                                      ],
                                      borderRadius: getBoarderRadius(20.00),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "طلب جديد لأسرة ${apiGet.notAcceptdeliveryOrderMap[index]['osra']['name']} ",
                                                    textAlign: TextAlign.right,
                                                    style: getStyle(
                                                        orange2Color,
                                                        FontWeight.w700,
                                                        16.sp),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
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
                    // title: Text('طلبات جديدة'),
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
