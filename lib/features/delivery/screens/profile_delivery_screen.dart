import 'package:delivery_boy/features/delivery/screens/sign_in_delivery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
import 'package:delivery_boy/components/widgets/custom_divider.dart';
import 'package:delivery_boy/components/widgets/custom_list_tile.dart';
import 'package:delivery_boy/features/delivery/screens/my_chats_screen.dart';
import 'package:delivery_boy/features/delivery/screens/my_orders_screen.dart';
import 'package:delivery_boy/features/delivery/screens/new_delivery_order_screen.dart';
import 'package:delivery_boy/features/delivery/screens/notification_delivery_scree.dart';
import 'package:delivery_boy/features/delivery/screens/comment_customer_delivery_screen.dart';
import 'package:delivery_boy/features/delivery/screens/edit_profile_delivery_screen.dart';
import 'package:delivery_boy/features/delivery/screens/contact_us_screen.dart';
import 'package:delivery_boy/services/firebase_chat.dart';
import 'package:delivery_boy/services/sp_helper.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

import 'change_locations copy.dart';

class ProfileDeliveryScreen extends StatefulWidget {
  @override
  _ProfileDeliveryScreenState createState() => _ProfileDeliveryScreenState();
}

class _ProfileDeliveryScreenState extends State<ProfileDeliveryScreen> {
  ApiGet apiGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return   
           Scaffold(
        backgroundColor: orangeColor,
        body: Obx(() {
          return apiGet.mapProfile.isEmpty
              ? loading()
              : Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(250),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(10),
                                right: ScreenUtil().setWidth(10),
                                top: ScreenUtil().setHeight(10),
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: ScreenUtil().setHeight(70),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: AppBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      leading: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: GetBuilder<ApiGet>(
                                          id: 'notification',
                                          init: ApiGet(),
                                          initState: (_) {},
                                          builder: (_) {
                                            return GetBuilder<ApiGet>(
                                              init: ApiGet(),
                                              id: 'notification',
                                              initState: (_) {},
                                              builder: (_) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FireBaseHelper.fireBaseHelper
                                                        .getAllMyChats(
                                                            myId: apiGet.mapProfile[
                                                                    'userprofile']
                                                                [0]['jawwal']);
                                                    apiGet.testChat();
                                                    Get.to(MyChatsScreen());
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      SvgPicture.asset(
                                                        chattingSvg,
                                                        color: whiteColor,
                                                      ),
                                                      _.countMessageUnRead == 0
                                                          ? Container()
                                                          : Positioned(
                                                              top: 0.0,
                                                              right: 0,
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      Colors.red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: 12,
                                                                  minHeight: 12,
                                                                ),
                                                                child: Text(
                                                                  '${_.countMessageUnRead}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 8,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      actions: [
                                        GetBuilder<ApiGet>(
                                          id: 'notification',
                                          init: ApiGet(),
                                          initState: (_) {},
                                          builder: (_) {
                                            return GestureDetector(
                                              onTap: () {
                                                _.changeNumberNotificationDelivery();
                                                Server.server
                                                    .getAllrequestforuser();
                                                Get.to(
                                                    NotificationDeliveryScreen());
                                              },
                                              child: GetBuilder<ApiGet>(
                                                init: ApiGet(),
                                                id: 'notification',
                                                initState: (_) {},
                                                builder: (_) {
                                                  return Stack(
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .solidBell,
                                                        color: whiteColor,
                                                      ),
                                                      _.numberNotificationDelivery ==
                                                              0
                                                          ? Container()
                                                          : Positioned(
                                                              top: 0.0,
                                                              right: 0,
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      Colors.red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: 12,
                                                                  minHeight: 12,
                                                                ),
                                                                child: Text(
                                                                  '${_.numberNotificationDelivery}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 8,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            )
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CachedNetworkImageShare(
                                    apiGet.mapProfile['userprofile'][0]
                                        ['delivery']['imageform'],
                                    65,
                                    65,
                                    0),
                                Positioned(
                                  right: -ScreenUtil().setWidth(13),
                                  top: ScreenUtil().setHeight(2),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(EditProfileDeliveryScreen());
                                    },
                                    child: Container(
                                      height: 18,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: getBoarderRadius(9.00),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Edit ",
                                          style: getStyle(
                                              redColor, FontWeight.w300, 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(9),
                            ),
                            Text(
                              apiGet.mapProfile['userprofile'][0]['name']
                                  .toString(),
                              style: getStyle(whiteColor, FontWeight.normal, 18),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(9),
                            ),
                            Text(
                              apiGet.mapProfile['userprofile'][0]['jawwal'],
                              style: getStyle(whiteColor, FontWeight.w300, 18),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(9),
                            ),
                            // Directionality(
                            //   textDirection: TextDirection.rtl,
                            //   child: RatingBar.readOnly(
                            //     initialRating: apiGet.mapProfile['userprofile'][0]
                            //                 ['rate'] ==
                            //             null
                            //         ? 0.0
                            //         : double.parse(apiGet
                            //             .mapProfile['userprofile'][0]['rate']),
                            //     isHalfAllowed: true,
                            //     halfFilledIcon: Icons.star_half,
                            //     filledIcon: Icons.star,
                            //     emptyIcon: Icons.star_border,
                            //     filledColor: whiteColor,
                            //     size: 25,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: ScreenUtil().setHeight(9),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(20),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.00),
                            topRight: Radius.circular(20.00),
                          ),
                        ),
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       apiGet.accountuserMap.isEmpty == null ||
                            //               apiGet.accountuserMap['accout'] == null
                            //           ? "0"
                            //           : "${double.parse(apiGet.accountuserMap['accout'].toString()).toStringAsFixed(2) ?? 0}  ريال  ",
                            //       textAlign: TextAlign.right,
                            //       style:
                            //           getStyle(blackColor, FontWeight.w300, 20),
                            //     ),
                            //     Text(
                            //       "رصيد الحساب ",
                            //       textAlign: TextAlign.right,
                            //       style:
                            //           getStyle(blackColor, FontWeight.normal, 20),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: ScreenUtil().setHeight(20),
                            // ),
                            // CustomDivider(),
                            // CustomListTile(
                            //   title: "إدارة الحساب",
                            //   onTap: () {
                            //     Get.to(()=>ChangeLocationLiveScreen(title:"تحديد الموقع"));
                            //   },
                            // ),
                            // CustomDivider(),
                            // GetBuilder<ApiGet>(
                            //   id: 'notification',
                            //   init: ApiGet(),
                            //   initState: (_) {},
                            //   builder: (_) {
                            //     return ListTile(
                            //       contentPadding: EdgeInsets.all(0),
                            //       onTap: () {
                            //         // _.changeNumberOrdersDelivery();
                            //         _.clear();
                            //         Server.server.orderdelivery();

                            //         Get.to(NewOrderDeliveryScreen());
                            //       },
                            //       title: _.numberOrdersDelivery == 0
                            //           ? Container()
                            //           : Row(
                            //               children: [
                            //                 Container(
                            //                   padding: EdgeInsets.symmetric(
                            //                       horizontal: 6, vertical: 2),
                            //                   decoration: BoxDecoration(
                            //                       shape: BoxShape.circle,
                            //                       color: Colors.red),
                            //                   alignment: Alignment.center,
                            //                   child: Text(
                            //                     '${_.numberOrdersDelivery}',
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //       trailing: Text(
                            //         "طلبات جديده ",
                            //         textAlign: TextAlign.right,
                            //         style: getStyle(
                            //             blackColor, FontWeight.normal, 20),
                            //       ),
                            //     );
                            //   },
                            // ),
                          
                            // CustomDivider(),
                           
                            CustomListTile(
                              title: "الطلبات",
                              onTap: () {
                                Server.server.requestdelivery();
                                Get.to(MyOrdersScreen());
                              },
                            ),
                       
                            CustomDivider(),
                           
                            CustomListTile(
                              title: "تعليقات العملاء ",
                              onTap: () {
                                Server.server.getevalute();
                                Get.to(CommentCustomerDeliveryScreen(false));
                              },
                            ),
                            CustomDivider(),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CupertinoSwitch(
                                  value: apiGet.isOpen.value,
                                  onChanged: (value) async {
                                    apiGet.isOpen.value = value;
                                    await Server.server
                                        .changIsopen(value ? '1' : '0');
                                  },
                                  activeColor: orangeColor,
                                ),
                                Text(
                                  "متواجد/ غير متواجد",
                                  textAlign: TextAlign.right,
                                  style:
                                      getStyle(blackColor, FontWeight.normal, 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            CustomDivider(),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            Text(
                              "أخري ",
                              textAlign: TextAlign.right,
                              style: getStyle(blackColor, FontWeight.w700, 20),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(ContactUsScreen());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "مساعده ",
                                    textAlign: TextAlign.right,
                                    style: getStyle(
                                        blackColor, FontWeight.normal, 20),
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Icon(
                                    Icons.help,
                                    color: orangeColor,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            GestureDetector(
                              onTap: () {
                                SPHelper.spHelper.setTokenDelivery(null);
                                updateStatusUser(
                                    apiGet.mapProfile['userprofile'][0]['jawwal'],
                                    'offline');
                                Get.offAll(SignInDeliveryScreen());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "تسجيل خروج ",
                                    textAlign: TextAlign.right,
                                    style: getStyle(
                                        blackColor, FontWeight.normal, 20),
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Icon(
                                    Icons.logout,
                                    color: orangeColor,
                                    textDirection: TextDirection.rtl,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        }),
           
      
    );
  }
}
