import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/features/families/widgets/step_custom.dart';
import 'package:delivery_boy/state/app_family_get.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';
import 'package:delivery_boy/features/delivery/screens/order_screen.dart';

class MyOrdersDetailsScreen extends StatelessWidget {
  ApiGet apiGet = Get.find();
  var stepIcons = [
    Icons.ac_unit,
    Icons.ac_unit,
    Icons.ac_unit,
    Icons.ac_unit,
  ];
  bool rejectOrder = false;

  final List<String> titles = [
    "طلب جديد",
    "قيد التحضير ",
    '''    تم التحضير    
في انتظار التوصيل''',
    "تم التسليم ",
  ];

  @override
  Widget build(BuildContext context) {
    Timer(Duration(minutes: 5), () {
      rejectOrder = true;
      // setState(() {});
    });
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
              GetBuilder<AppFamilyGet>(builder: (controller) {
                return Expanded(
                  child: DefaultTabController(
                    length: 1,
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
                                    "الطلبات",
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
                          Obx(
                            () {
                              return apiGet.deliveryOrderDeyailsMap2.isEmpty
                                  ? loading()
                                  : Expanded(
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: TabBarView(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                StepProgressView(
                                                  icons: stepIcons,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  curStep: apiGet.deliveryOrderDeyailsMap2[
                                                                  'deliver_order']
                                                              [0]['status'] ==
                                                          '4'
                                                      ? 2
                                                      : controller.curStep + 1,
                                                  color: orangeColor,
                                                  titles: titles,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                ScreenUtil()
                                                                    .setWidth(
                                                                        10)),
                                                    child: ListView(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .person,
                                                                      color:
                                                                          grayColor,
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                    Text(
                                                                      apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['osra']
                                                                              [
                                                                              0]
                                                                          [
                                                                          'jawwal'],
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                      style: getStyle(
                                                                          blackColor,
                                                                          FontWeight
                                                                              .w300,
                                                                          18),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: ScreenUtil()
                                                                    .setHeight(
                                                                        20)),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      FontAwesomeIcons
                                                                          .mapMarkerAlt,
                                                                      color:
                                                                          grayColor,
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                    apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['osra'][0]['address'].length >
                                                                            10
                                                                        ? Text(
                                                                            '${apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['osra'][0]['address'].toString().substring(0, 17)}' ??
                                                                                'لا يوجد موقع',
                                                                            textAlign:
                                                                                TextAlign.right,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: getStyle(
                                                                                blackColor,
                                                                                FontWeight.w300,
                                                                                16),
                                                                          )
                                                                        : Text(
                                                                            apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['osra'][0]['address'] ??
                                                                                'لا يوجد موقع',
                                                                            textAlign:
                                                                                TextAlign.right,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: getStyle(
                                                                                blackColor,
                                                                                FontWeight.w300,
                                                                                16),
                                                                          ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          20),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      FontAwesomeIcons
                                                                          .moneyBill,
                                                                      color:
                                                                          grayColor,
                                                                      size: 20,
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                    Text(
                                                                      apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['is_cash'].toString() !=
                                                                              '1'
                                                                          ? "الدفع أونلاين"
                                                                          : "الدفع عند الاستلام",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                      style: getStyle(
                                                                          blackColor,
                                                                          FontWeight
                                                                              .w300,
                                                                          18),
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  // '${controller.curStep}',
                                                                  '${(double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['total_price']) + double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['cost_delivery'])).toStringAsFixed(2)} ريال ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style: getStyle(
                                                                      blackColor,
                                                                      FontWeight
                                                                          .w300,
                                                                      18),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          20),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      FontAwesomeIcons
                                                                          .moneyBill,
                                                                      color:
                                                                          grayColor,
                                                                      size: 20,
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                    Text(
                                                                      'سعر الأطباق',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                      style: getStyle(
                                                                          blackColor,
                                                                          FontWeight
                                                                              .w300,
                                                                          18),
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  // '${controller.curStep}',
                                                                  '${double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['total_price']).toStringAsFixed(2)} ريال ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style: getStyle(
                                                                      blackColor,
                                                                      FontWeight
                                                                          .w300,
                                                                      18),
                                                                ),
                                                              ],
                                                            ),

                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          20),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      FontAwesomeIcons
                                                                          .moneyBill,
                                                                      color:
                                                                          grayColor,
                                                                      size: 20,
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                    Text(
                                                                      'سعر التوصيل',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                      style: getStyle(
                                                                          blackColor,
                                                                          FontWeight
                                                                              .w300,
                                                                          18),
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  // '${controller.curStep}',
                                                                  '${double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['cost_delivery']).toStringAsFixed(2)}ريال ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style: getStyle(
                                                                      blackColor,
                                                                      FontWeight
                                                                          .w300,
                                                                      18),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          20),
                                                            ),

                                                            // Row(
                                                            //   mainAxisAlignment:
                                                            //       MainAxisAlignment
                                                            //           .spaceBetween,
                                                            //   children: [
                                                            //     Row(
                                                            //       children: [
                                                            //         Icon(
                                                            //           FontAwesomeIcons.hourglass,
                                                            //           color:
                                                            //               grayColor,
                                                            //           size:
                                                            //               24,
                                                            //         ),
                                                            //         SizedBox(
                                                            //           width:
                                                            //               ScreenUtil().setWidth(10),
                                                            //         ),
                                                            //         Text(
                                                            //           "وقت الطلب",
                                                            //           textAlign:
                                                            //               TextAlign.right,
                                                            //           style: getStyle(
                                                            //               blackColor,
                                                            //               FontWeight.w300,
                                                            //               18),
                                                            //         ),
                                                            //       ],
                                                            //     ),
                                                            //     Text(
                                                            //       "م 3:30",
                                                            //       textAlign:
                                                            //           TextAlign.right,
                                                            //       style: getStyle(
                                                            //           blackColor,
                                                            //           FontWeight.w300,
                                                            //           18),
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                            // SizedBox(
                                                            //   height: ScreenUtil()
                                                            //       .setHeight(
                                                            //           20),
                                                            // ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      FontAwesomeIcons
                                                                          .hourglass,
                                                                      color:
                                                                          grayColor,
                                                                      size: 24,
                                                                    ),
                                                                    SizedBox(
                                                                      width: ScreenUtil()
                                                                          .setWidth(
                                                                              10),
                                                                    ),
                                                                    Text(
                                                                      "وقت التوصيل",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                      style: getStyle(
                                                                          blackColor,
                                                                          FontWeight
                                                                              .w300,
                                                                          18),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  apiGet
                                                                      .deliveryOrderDeyailsMap2[
                                                                          'deliver_order']
                                                                          [0][
                                                                          'end_request']
                                                                      .toString()
                                                                      .split(
                                                                          ' ')[1],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style: getStyle(
                                                                      blackColor,
                                                                      FontWeight
                                                                          .w300,
                                                                      18),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          50),
                                                            ),
                                                            apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['status'] != '4' ||
                                                                    rejectOrder ||
                                                                    apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                            [
                                                                            'status'] ==
                                                                        '6' ||
                                                                    apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                            [
                                                                            'status'] ==
                                                                        '7'
                                                                ? Container()
                                                                : CustomButton(
                                                                    title:
                                                                        'إلغاء الطلب',
                                                                    onTap: () {
                                                                      // FocusScope.of(
                                                                      //         context)
                                                                      //     .unfocus();
                                                                      Server.server.changestatusdelivery(
                                                                          apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                              [
                                                                              'request_id'],
                                                                          '5',
                                                                          apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                              [
                                                                              'osra_id']);
                                                                      // Get.back();
                                                                    },
                                                                  ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          10),
                                                            ),
                                                            apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['status'] == '4' ||
                                                                    apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                            [
                                                                            'status'] ==
                                                                        '6' ||
                                                                    apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                            [
                                                                            'status'] ==
                                                                        '7'
                                                                ? Container()
                                                                : CustomButton(
                                                                    title:
                                                                        'تم تسليم للعميل',
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();

                                                                      Server.server.changestatusdelivery(
                                                                          apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                              [
                                                                              'request_id'],
                                                                          '6',
                                                                          apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                              [
                                                                              'osra_id']);
                                                                      controller
                                                                          .setCurentStep(
                                                                              4);
                                                                      controller
                                                                          .setShowDetailsOrders(
                                                                              false);
                                                                    },
                                                                  ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          10),
                                                            ),
                                                            apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['status'] == '4' ||
                                                                    apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                            [
                                                                            'status'] ==
                                                                        '6' ||
                                                                    apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]
                                                                            [
                                                                            'status'] ==
                                                                        '7'
                                                                ? Container()
                                                                : CustomButton(
                                                                    title:
                                                                        'تتبع الطلب',
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();

                                                                      Get.to(
                                                                          MyOrderMapScreen(
                                                                        double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['osra'][0]
                                                                            [
                                                                            'latitude']),
                                                                        double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['osra'][0]
                                                                            [
                                                                            'longitude']),
                                                                        double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['userapp']
                                                                            [
                                                                            'latitude']),
                                                                        double.parse(apiGet.deliveryOrderDeyailsMap2['deliver_order'][0]['userapp']
                                                                            [
                                                                            'longitude']),
                                                                      ));
                                                                    },
                                                                  ),
                                                            SizedBox(
                                                              height:
                                                                  ScreenUtil()
                                                                      .setHeight(
                                                                          20),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
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
