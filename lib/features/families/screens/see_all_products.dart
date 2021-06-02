// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/custom_divider.dart';
// import 'package:delivery_boy/features/families/widgets/card_food.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class SeeAllProductsScreen extends StatelessWidget {
//   ApiGet apiGet = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         Server.server.getosraproduct();

//         return Future.value(true);
//       },
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       width: Get.width,
//                       height: ScreenUtil().setHeight(180),
//                       color: blackColor,
//                       child: Image.asset(
//                         homefamilyPng,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: ScreenUtil().setHeight(30),
//                 ),
//                 DefaultTabController(
//                   length: 1,
//                   child: Expanded(
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: SizedBox(
//                               height: ScreenUtil().setHeight(60),
//                               width: ScreenUtil().setWidth(187),
//                               child: TabBar(
//                                 unselectedLabelColor: blackColor,
//                                 labelColor: orangeColor,
//                                 indicatorWeight: 2,
//                                 tabs: [
//                                   Tab(
//                                     child: Text(
//                                       "جميع الاطباق ",
//                                     ),
//                                   ),
//                                 ],
//                                 indicatorColor: orangeColor,
//                                 labelStyle: getStyle(
//                                   orangeColor,
//                                   FontWeight.w700,
//                                   18,
//                                 ),
//                                 unselectedLabelStyle: getStyle(
//                                   blackColor,
//                                   FontWeight.w300,
//                                   18,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Obx(() {
//                             return Expanded(
//                               child: apiGet.mapProductFamily.isEmpty
//                                   ? loading()
//                                   : TabBarView(
//                                       children: [
//                                         Container(
//                                           child: apiGet
//                                                       .mapProductFamily[
//                                                           'osraproduct']
//                                                       .length ==
//                                                   0
//                                               ? Center(
//                                                   child: Text('لا يوجد منتجات'))
//                                               : ListView.separated(
//                                                   separatorBuilder:
//                                                       (context, index) {
//                                                     return CustomDivider();
//                                                   },
//                                                   itemCount: apiGet
//                                                       .mapProductFamily[
//                                                           'osraproduct']
//                                                       .length,
//                                                   itemBuilder:
//                                                       (context, index) {
//                                                     return CardFood(
//                                                       map: apiGet
//                                                               .mapProductFamily[
//                                                           'osraproduct'][index],
//                                                     );
//                                                   },
//                                                 ),
//                                         ),
//                                       ],
//                                     ),
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Directionality(
//               textDirection: TextDirection.rtl,
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: SizedBox(
//                   height: ScreenUtil().setHeight(100),
//                   child: AppBar(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: ScreenUtil().setHeight(160),
//               left: ScreenUtil().setWidth(25),
//               child: Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: Container(
//                   height: ScreenUtil().setHeight(40),
//                   width: ScreenUtil().setWidth(335),
//                   decoration: BoxDecoration(
//                     color: whiteColor,
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(0.00, 3.00),
//                         color: blackColor.withOpacity(0.16),
//                         blurRadius: 6,
//                       ),
//                     ],
//                     borderRadius: getBoarderRadius(20),
//                   ),
//                   child: ClipRRect(
//                     clipBehavior: Clip.antiAlias,
//                     borderRadius: getBoarderRadius(20),
//                     child: TextFormField(
//                       onChanged: (value) {
//                         if (value == null || value == '') {
//                           Server.server.getosraproduct();
//                         } else {
//                           Server.server.getSearchOsraProduct(value);
//                         }
//                       },
//                       decoration: InputDecoration(
//                         focusedBorder: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         contentPadding: EdgeInsets.only(
//                             top: 5, left: 10, right: 10, bottom: 5),
//                         hintText: 'بحث عن أطباق',
//                         hintStyle: getStyle(grayColor, FontWeight.normal, 14),
//                         fillColor: whiteColor,
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: getBoarderRadius(20),
//                           borderSide: BorderSide(width: 0),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: blackColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
