import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
import 'package:delivery_boy/components/widgets/custom_divider.dart';
import 'package:delivery_boy/features/delivery/screens/contact_us_screen.dart';
import 'package:delivery_boy/features/families/screens/profile_family_screen.dart';
import 'package:delivery_boy/features/privacy_screen.dart';
import 'package:delivery_boy/services/sp_helper.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  ApiGet apiGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    width: 141.9.w,
                    height: 62.82.h,
                    child: SvgPicture.asset(
                      splash2Svg,
                      fit: BoxFit.fill,
                      color: orangeColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Obx(() {
                  return apiGet.mapProfile.isEmpty
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            Get.back();

                            // Get.to(ProfileFamilyScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  apiGet.mapProfile['userprofile'][0]['name']
                                      .toString(),
                                  textAlign: TextAlign.right,
                                  style: getStyle(
                                      blackColor, FontWeight.normal, 16.sp),
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                CachedNetworkImageShare(
                                    apiGet.mapProfile['userprofile'][0]
                                        ['osra_user']['image'],
                                    40,
                                    40,
                                    0),
                              ],
                            ),
                          ),
                        );
                }),
                SizedBox(
                  height: 10.h,
                ),
                CustomDivider(),
                GestureDetector(
                  onTap: () {
                    Get.to(PrivacyScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20),
                      vertical: ScreenUtil().setHeight(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "سياسة الخصوصية",
                          textAlign: TextAlign.right,
                          style: getStyle(blackColor, FontWeight.normal, 16),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Container(
                          height: ScreenUtil().setHeight(30),
                          width: ScreenUtil().setWidth(30),
                          child: SvgPicture.asset(
                            policySvg,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                // height: ScreenUtil().setHeight(10),
                // ),
                // CustomDivider(),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: ScreenUtil().setWidth(20),
                //     vertical: ScreenUtil().setHeight(10),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         "شروط الاستخدام ",
                //         textAlign: TextAlign.right,
                //         style: getStyle(blackColor, FontWeight.normal, 16),
                //       ),
                //       SizedBox(
                //         width: 11.w,
                //       ),
                //       Container(
                //         height: ScreenUtil().setHeight(30),
                //         width: ScreenUtil().setWidth(30),
                //         child: SvgPicture.asset(
                //           policy2Svg,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                CustomDivider(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.to(ContactUsScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20),
                      vertical: ScreenUtil().setHeight(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "مساعدة",
                          textAlign: TextAlign.right,
                          style: getStyle(blackColor, FontWeight.normal, 16),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Container(
                          height: ScreenUtil().setHeight(30),
                          width: ScreenUtil().setWidth(30),
                          child: SvgPicture.asset(
                            helpSvg,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                CustomDivider(),
                SizedBox(
                  height: 130.h,
                ),
                Obx(() {
                  return apiGet.contactMap.isEmpty
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 60.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  var url =
                                      "tel:${apiGet.contactMap['contact'][0]['jawwal']}";
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Container(
                                  height: ScreenUtil().setHeight(30),
                                  width: ScreenUtil().setWidth(30),
                                  child: SvgPicture.asset(
                                    callSvg,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(20),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var url =
                                      "https://www.snapchat.com/add/${apiGet.contactMap['contact'][0]['snapchat']}?fbclid=IwAR1SjYi9PrVl9fdtErRl7Cdif6_RjrjzuDUx5yCOeLA62Pzhp9yhTT9C1Ko";
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Container(
                                  height: ScreenUtil().setHeight(30),
                                  width: ScreenUtil().setWidth(30),
                                  child: SvgPicture.asset(
                                    snapchatSvg,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(20),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var url =
                                      "https://wa.me/${apiGet.contactMap['contact'][0]['jawwal']}";
                                  try {
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {}
                                  } catch (e) {}
                                },
                                child: Container(
                                  height: ScreenUtil().setHeight(30),
                                  width: ScreenUtil().setWidth(30),
                                  child: SvgPicture.asset(
                                    whatsappSvg,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                }),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    SPHelper.spHelper.setTokenFamily(null);
                    apiGet.mapProductFamily.assignAll({});
                    apiGet.osraOrderMap.assignAll([]);
                    apiGet.osraOrderDeyailsMap.assignAll({});
                    // Get.offAll(SignInDeliveryScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20),
                      vertical: ScreenUtil().setHeight(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تسجيل خروج ",
                          textAlign: TextAlign.right,
                          style: getStyle(blackColor, FontWeight.normal, 16),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(40),
                          width: ScreenUtil().setWidth(40),
                          child: Icon(
                            Icons.logout,
                            color: orange2Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
