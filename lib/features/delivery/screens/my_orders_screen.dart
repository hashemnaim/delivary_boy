import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/features/delivery/screens/my_order_details_screen.dart';
import 'package:delivery_boy/features/delivery/widgets/order_card.dart';
import 'package:delivery_boy/state/app_family_get.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class MyOrdersScreen extends StatelessWidget {
  ApiGet apiGet = Get.find();
  AppFamilyGet appGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 250.h,
                child: Image.asset(
                  backDeliverytopSvg,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 1,
                  // initialIndex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TabBar(
                            unselectedLabelColor: blackColor,
                            labelColor: orangeColor,
                            indicatorWeight: 2,
                            isScrollable: true,
                            tabs: [
                              Tab(
                                child: Text(
                                  "جميع الطلبات",
                                ),
                              ),
                            ],
                            indicatorColor: orangeColor,
                            labelStyle: getStyle(
                              orangeColor,
                              FontWeight.w700,
                              18,
                            ),
                            unselectedLabelStyle: getStyle(
                              blackColor,
                              FontWeight.w300,
                              18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Obx(() {
                                return apiGet.deliveryAllOrderMap.isEmpty
                                    ? loading()
                                    : apiGet
                                                .deliveryAllOrderMap[
                                                    'deliver_order']
                                                .length ==
                                            0
                                        ? Center(
                                            child: Text('لا يوجد طلبات'),
                                          )
                                        : ListView.builder(
                                            itemCount: apiGet
                                                .deliveryAllOrderMap[
                                                    'deliver_order']
                                                .length,
                                                // reverse: 
                                                // true,
                                            itemBuilder: (context, index) {
                                                return GestureDetector(
                                                onTap: () {
                                                  apiGet
                                                      .deliveryOrderDeyailsMap2
                                                      .assignAll({}) ;
                                                  Server.server
                                                      .orderDeailsDelivery(apiGet
                                                          .deliveryAllOrderMap[
                                                              'deliver_order']
                                                              [index]
                                                              ['request_id']
                                                          .toString());
                                                  //3 ==> تم التوصيل
                                                   appGet.setCurentStep(apiGet.deliveryAllOrderMap['deliver_order']
                                                                      [index]
                                                                  ['status'] ==
                                                              '2' ||
                                                          apiGet.deliveryAllOrderMap['deliver_order']
                                                                      [index]
                                                                  ['status'] ==
                                                              '10'
                                                      ? 2
                                                      : apiGet.deliveryAllOrderMap['deliver_order']
                                                                      [index]
                                                                  ['status'] ==
                                                              '3'
                                                          ? 3
                                                          : apiGet.deliveryAllOrderMap['deliver_order'][index]['status'] == '4' ||
                                                                  apiGet.deliveryAllOrderMap['deliver_order'][index]['status'] ==
                                                                      '6' ||
                                                                  apiGet.deliveryAllOrderMap['deliver_order'][index]
                                                                          ['status'] ==
                                                                      '7'
                                                              ? 4
                                                              : 1);
                                                  apiGet.deliveryAllOrderMap['deliver_order'][index]
                                                                  ['status'] ==
                                                              '4' ||
                                                          apiGet.deliveryAllOrderMap['deliver_order']
                                                                      [index]
                                                                  ['status'] ==
                                                              '3' ||
                                                          apiGet.deliveryAllOrderMap['deliver_order']
                                                                      [index]
                                                                  ['status'] ==
                                                              '2' ||
                                                          apiGet.deliveryAllOrderMap['deliver_order']
                                                                      [index]
                                                                  ['status'] ==
                                                              '9' ||
                                                          apiGet.deliveryAllOrderMap['deliver_order']
                                                                      [index]
                                                                  ['status'] ==
                                                              '6' ||
                                                          apiGet.deliveryAllOrderMap['deliver_order']
                                                                  [index]['status'] ==
                                                              '7' ||
                                                          apiGet.deliveryAllOrderMap['deliver_order'][index]['status'] == '10'
                                                      ? Get.to(MyOrdersDetailsScreen())
                                                      : print('');
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 8.h,
                                                      left: 8.w,
                                                      right: 8.w,
                                                      bottom: 8.h),
                                                  child: OrderCard(apiGet
                                                          .deliveryAllOrderMap[
                                                      'deliver_order'][index]),
                                                ),
                                              );
                                            },
                                          );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  // actions: [
                  //   Icon(Icons.arrow_forward),
                  // ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
