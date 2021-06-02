// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/backend/auth_get.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/components/widgets/custom_drop_down.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class ChooseBaqaScreen extends StatefulWidget {
//   final bool isFirst;
//   ChooseBaqaScreen(this.isFirst);
//   @override
//   _ChooseBaqaScreenState createState() => _ChooseBaqaScreenState();
// }

// class _ChooseBaqaScreenState extends State<ChooseBaqaScreen> {
//   showDialogContainer(List data, dynamic controller) {
//     return Container(
//       height: data.length * 70.h,
//       width: 335.w,
//       decoration: BoxDecoration(
//         color: whiteColor,
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0.00, 3.00),
//             color: blackColor.withOpacity(0.16),
//             blurRadius: 6,
//           ),
//         ],
//         borderRadius: getBoarderRadius(18.00),
//       ),
//       child: ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 controller.setsubSelexted(index);
//                 baqaIdChoose =
//                     controller.subBaqa['subParticipation'][index]['id'];
//                 price = controller.subBaqa['subParticipation'][index]['price'];
               
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(
//                   vertical: ScreenUtil().setWidth(12),
//                   horizontal: ScreenUtil().setWidth(20),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         data[index]['name'].toString(),
//                         textAlign: TextAlign.right,
//                         style: getStyle(
//                           Color(0xff535353),
//                           FontWeight.normal,
//                           16,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: ScreenUtil().setWidth(15),
//                     ),
//                     index == controller.subSelexted
//                         ? SvgPicture.asset(
//                             checkCompleteSvg,
//                           )
//                         : SvgPicture.asset(
//                             checkNoCompleteSvg,
//                           ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }

//   int baqaIdChoose;
//   String price;
//   @override
//   void initState() {
//     Server.server.getArticipation();

//     super.initState();
//   }

//   AuthGet authGet = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       body: Stack(
//         children: [
//           Transform.translate(
//             offset: Offset(-80.w, -90.h),
//             child: Container(
//               width: 307.w,
//               height: 307.h,
//               child: Image.asset(
//                 burger1Svg,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(
//               horizontal: 20.w,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   height: 200.h,
//                 ),
//                 Text(
//                   "قم باختيار الباقة المناسبه لك ",
//                   textAlign: TextAlign.right,
//                   style: getStyle(blackColor, FontWeight.w700, 20.sp),
//                 ),
//                 GetBuilder<ApiGet>(
//                     init: ApiGet(),
//                     id: 'baqa',
//                     builder: (controller) {
//                       return Expanded(
//                         child: controller.baqa.isEmpty
//                             ? loading()
//                             : ListView.builder(
//                                 itemCount:
//                                     controller.baqa['Participation'].length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Column(
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () async {
//                                           controller.setindexSelectes(index);

//                                           await Server.server
//                                               .getsubparticipation(controller
//                                                   .baqa['Participation'][index]
//                                                       ['id']
//                                                   .toString());
//                                         },
//                                         child: CustomDropDownButton(
//                                           isCheck:
//                                               controller.indexSelectes == index,
//                                           title:
//                                               controller.baqa['Participation']
//                                                   [index]['name'],
//                                           isChoose: true,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 8.h,
//                                       ),
//                                       controller.indexSelectes == index
//                                           ? controller.subBaqa.isEmpty
//                                               ? Container()
//                                               : showDialogContainer(
//                                                   controller.subBaqa[
//                                                       'subParticipation'],
//                                                   controller)
//                                           : Container(),
//                                       SizedBox(
//                                         height: 20.h,
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                       );
//                     }),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: CustomButton(
//                     title: 'اختيار ',
//                     onTap: () async {
//                       FocusScope.of(context).unfocus();

//                       if (baqaIdChoose == null) {
//                         getSheetSucsses('الرجاء اختيار الباقة المناسبة ');
//                       } else {
//                         Server.server.initPayment(
//                           baqaIdChoose.toString(),
//                           price,
//                           widget.isFirst,
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Directionality(
//             textDirection: TextDirection.rtl,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: SizedBox(
//                 height: 100.h,
//                 child: AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   automaticallyImplyLeading: true,
//                   iconTheme: IconThemeData(color: blackColor),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
