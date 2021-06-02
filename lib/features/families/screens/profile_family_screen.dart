// import 'package:delivery_boy/features/delivery/screens/change_locations%20copy.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:rating_bar/rating_bar.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
// import 'package:delivery_boy/components/widgets/custom_divider.dart';
// import 'package:delivery_boy/components/widgets/custom_list_tile.dart';
// import 'package:delivery_boy/features/delivery/screens/comment_customer_delivery_screen.dart';
// import 'package:delivery_boy/features/families/screens/edit_profile_family_screen.dart';
// import 'package:delivery_boy/features/families/screens/my_baqa_screen.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';

// class ProfileFamilyScreen extends StatelessWidget {
//   ApiGet apiGet = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: orangeColor,
//       body: Obx(() {
//         return apiGet.mapProfile.isEmpty
//             ? loading()
//             : Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: ScreenUtil().setHeight(240),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Align(
//                           alignment: Alignment.topCenter,
//                           child: SizedBox(
//                             height: ScreenUtil().setHeight(70),
//                             child: Directionality(
//                               textDirection: TextDirection.rtl,
//                               child: AppBar(
//                                 backgroundColor: Colors.transparent,
//                                 elevation: 0,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             CachedNetworkImageShare(
//                                 apiGet.mapProfile['userprofile'][0]['osra_user']
//                                     ['image'],
//                                 65,
//                                 65,
//                                 0),
//                             Positioned(
//                               right: -ScreenUtil().setWidth(13),
//                               top: ScreenUtil().setHeight(2),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Get.to(EditProfileFamilyScreen());
//                                 },
//                                 child: Container(
//                                   height: 18,
//                                   width: 36,
//                                   decoration: BoxDecoration(
//                                     color: whiteColor,
//                                     borderRadius: getBoarderRadius(9.00),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Edit ",
//                                       style: getStyle(
//                                           redColor, FontWeight.w300, 12),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: ScreenUtil().setHeight(5),
//                         ),
//                         Text(
//                           apiGet.mapProfile['userprofile'][0]['name']
//                               .toString(),
//                           style: getStyle(whiteColor, FontWeight.normal, 18),
//                         ),
//                         SizedBox(
//                           height: ScreenUtil().setHeight(5),
//                         ),
//                         Text(
//                           apiGet.mapProfile['userprofile'][0]['jawwal'],
//                           style: getStyle(whiteColor, FontWeight.w300, 18),
//                         ),
//                         SizedBox(
//                           height: ScreenUtil().setHeight(5),
//                         ),
//                         Expanded(
//                           child: Directionality(
//                             textDirection: TextDirection.rtl,
//                             child: RatingBar.readOnly(
//                               initialRating: apiGet.mapProfile['userprofile'][0]
//                                           ['rate'] ==
//                                       null
//                                   ? 0.0
//                                   : double.parse(apiGet
//                                       .mapProfile['userprofile'][0]['rate']),
//                               isHalfAllowed: true,
//                               halfFilledIcon: Icons.star_half,
//                               filledIcon: Icons.star,
//                               emptyIcon: Icons.star_border,
//                               filledColor: whiteColor,
//                               size: 25,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: ScreenUtil().setWidth(20),
//                       ),
//                       decoration: BoxDecoration(
//                         color: Color(0xffffffff),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20.00),
//                           topRight: Radius.circular(20.00),
//                         ),
//                       ),
//                       child: ListView(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 apiGet.accountuserMap.isEmpty == null ||
//                                         apiGet.accountuserMap['accout'] == null
//                                     ? "0"
//                                     : "${double.parse(apiGet.accountuserMap['accout'].toString()).toStringAsFixed(2) ?? 0}   ريال ",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.w300, 20),
//                               ),
//                               Text(
//                                 "رصيد الحساب ",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.normal, 20),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           CustomDivider(),
//                           CustomListTile(
//                             title: "إدارة الحساب",
//                             onTap: () {
//                               Get.to(()=>ChangeLocationLiveScreen());
//                             },
//                           ),
//                           CustomDivider(),
//                           CustomListTile(
//                             title: "تعليقات العملاء ",
//                             onTap: () {
//                               Server.server.getevalute();
//                               Get.to(CommentCustomerDeliveryScreen(true));
//                             },
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(10),
//                           ),
//                           CustomDivider(),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(10),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CupertinoSwitch(
//                                 value: apiGet.isOpen.value,
//                                 onChanged: (value) async {
//                                   apiGet.isOpen.value = value;
//                                   await Server.server
//                                       .changIsopen(value ? '1' : '0');
//                                 },
//                                 activeColor: orangeColor,
//                               ),
//                               Text(
//                                 "مغلق/ مفتوح",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.normal, 20),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           CustomDivider(),
//                           CustomListTile(
//                             title: "الباقات ",
//                             onTap: () {
//                               Get.back();
//                               Get.to(MyBawaFamilyScreen());
//                             },
//                           ),
//                           CustomDivider(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//       }),
//     );
//   }
// }
