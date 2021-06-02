// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/features/families/widgets/notification_card.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class NotificationFamilyScreen extends StatelessWidget {
//   ApiGet apiGet = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: whiteColor,
//         body: Stack(
//           children: [
//             Transform.translate(
//               offset: Offset(-90, -70),
//               child: Container(
//                 width: ScreenUtil().setWidth(280),
//                 height: ScreenUtil().setHeight(280),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: AssetImage(
//                       top5Svg,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   height: ScreenUtil().setHeight(170),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: ScreenUtil().setWidth(20),
//                   ),
//                   child: Text(
//                     "التنبيهات ",
//                     textAlign: TextAlign.right,
//                     style: getStyle(blackColor, FontWeight.w700, 20),
//                   ),
//                 ),
//                 Expanded(
//                   child: Obx(() {
//                     return apiGet.notificationMap.isEmpty
//                         ? loading()
//                         : apiGet.notificationMap['purchase'].length == 0
//                             ? Center(
//                                 child: Text('لا يوجد إشعارات'),
//                               )
//                             : ListView.builder(
//                                 itemCount:
//                                     apiGet.notificationMap['purchase'].length,
//                                 itemBuilder: (context, index) {
//                                   return Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: NotificationCard(apiGet
//                                         .notificationMap['purchase'][index]),
//                                   );
//                                 },
//                               );
//                   }),
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: SizedBox(
//                 height: ScreenUtil().setHeight(100),
//                 child: Directionality(
//                   textDirection: TextDirection.rtl,
//                   child: AppBar(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     iconTheme: IconThemeData(color: blackColor),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
