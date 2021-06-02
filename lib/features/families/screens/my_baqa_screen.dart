// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/features/families/screens/choose_baqa_screen.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';

// class MyBawaFamilyScreen extends StatefulWidget {
//   @override
//   _MyBawaFamilyScreenState createState() => _MyBawaFamilyScreenState();
// }

// class _MyBawaFamilyScreenState extends State<MyBawaFamilyScreen> {
//   ApiGet apiGet = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: orangeColor,
//         appBar: AppBar(
//           backgroundColor: orangeColor,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             "باقاتي",
//             textAlign: TextAlign.right,
//             style: getStyle(whiteColor, FontWeight.w700, 20),
//           ),
//         ),
//         body: Column(
//           children: [
//             SizedBox(
//               height: ScreenUtil().setHeight(20),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: ScreenUtil().setWidth(20),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Color(0xffffffff),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20.00),
//                     topRight: Radius.circular(20.00),
//                   ),
//                 ),
//                 child: ListView(
//                   children: [
//                     Obx((() {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   // if ((int.parse(apiGet.mapProfile[
//                                   //                     'userprofile'][0]
//                                   //                 ['subscribe']['noproduct']) -
//                                   //             apiGet
//                                   //                 .mapProductFamily[
//                                   //                     'osraproduct']
//                                   //                 .length)
//                                   //         .toString() ==
//                                   //     '0') {
//                                   Get.to(ChooseBaqaScreen(false));
//                                   // } else {
//                                   //   getSheetError('أنت مشترك بباقة حالية');
//                                   // }
//                                 },
//                                 child: Text(
//                                   "تعديل",
//                                   textAlign: TextAlign.right,
//                                   style: getStyle(
//                                       orangeColor, FontWeight.normal, 20),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Text(
//                             "الباقة الخاصة ",
//                             textAlign: TextAlign.right,
//                             style: getStyle(blackColor, FontWeight.w700, 18),
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "الباقة الرئيسية ",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(orangeColor, FontWeight.w300, 17),
//                               ),
//                               SizedBox(
//                                 width: ScreenUtil().setHeight(10),
//                               ),
//                               Text(
//                                 apiGet.mapProfile['userprofile'][0]['subscribe']
//                                     ['participation'],
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.w300, 17),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "الباقة الثانوية ",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(orangeColor, FontWeight.w300, 17),
//                               ),
//                               SizedBox(
//                                 width: ScreenUtil().setHeight(10),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   apiGet.mapProfile['userprofile'][0]
//                                       ['subscribe']['sub_part_id'],
//                                   textAlign: TextAlign.right,
//                                   style:
//                                       getStyle(blackColor, FontWeight.w300, 17),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "عدد المنتجات في الباقة",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(orangeColor, FontWeight.w300, 17),
//                               ),
//                               SizedBox(
//                                 width: ScreenUtil().setHeight(10),
//                               ),
//                               Text(
//                                 apiGet.mapProfile['userprofile'][0]['subscribe']
//                                     ['noproduct'],
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.w300, 17),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "عدد المنتجات المستهلكة",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(orangeColor, FontWeight.w300, 17),
//                               ),
//                               SizedBox(
//                                 width: ScreenUtil().setHeight(10),
//                               ),
//                               Text(
//                                 apiGet.mapProductFamily['osraproduct'].length
//                                     .toString(),
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.w300, 17),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "عدد المنتجات المتبقية",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(orangeColor, FontWeight.w300, 17),
//                               ),
//                               SizedBox(
//                                 width: ScreenUtil().setHeight(10),
//                               ),
//                               Text(
//                                 (int.parse(apiGet.mapProfile['userprofile'][0]
//                                             ['subscribe']['noproduct']) -
//                                         apiGet.mapProductFamily['osraproduct']
//                                             .length)
//                                     .toString(),
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.w300, 17),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "بداية الاشتراك",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(orangeColor, FontWeight.w300, 17),
//                               ),
//                               SizedBox(
//                                 width: ScreenUtil().setHeight(10),
//                               ),
//                               Text(
//                                 apiGet.mapProfile['userprofile'][0]['subscribe']
//                                         ['start_date']
//                                     .split(' ')[0]
//                                     .toString(),
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.w300, 17),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(20),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "نهاية الاشتراك",
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(orangeColor, FontWeight.w300, 17),
//                               ),
//                               SizedBox(
//                                 width: ScreenUtil().setHeight(10),
//                               ),
//                               Text(
//                                 apiGet.mapProfile['userprofile'][0]['subscribe']
//                                         ['end_date']
//                                     .split(' ')[0]
//                                     .toString(),
//                                 textAlign: TextAlign.right,
//                                 style:
//                                     getStyle(blackColor, FontWeight.w300, 17),
//                               ),
//                             ],
//                           ),
//                         ],
//                       );
//                     })),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
