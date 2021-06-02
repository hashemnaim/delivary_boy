// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:rating_bar/rating_bar.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/components/widgets/custom_divider.dart';
// import 'package:delivery_boy/features/delivery/screens/my_chats_screen.dart';
// import 'package:delivery_boy/features/families/screens/add_product_screen.dart';
// import 'package:delivery_boy/features/families/screens/details_product_screen.dart';
// import 'package:delivery_boy/features/families/screens/notification_family_screen.dart';
// import 'package:delivery_boy/features/families/screens/see_all_products.dart';
// import 'package:delivery_boy/features/families/widgets/card_food.dart';
// import 'package:delivery_boy/features/families/widgets/custom_drawer.dart';
// import 'package:delivery_boy/features/families/widgets/step_custom.dart';
// import 'package:delivery_boy/services/firebase_chat.dart';
// import 'package:delivery_boy/state/app_family_get.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class HomeFamilyScreen extends StatefulWidget {
//   @override
//   _HomeFamilyScreenState createState() => _HomeFamilyScreenState();
// }

// class _HomeFamilyScreenState extends State<HomeFamilyScreen> {
//   final AppFamilyGet appGet = Get.put(AppFamilyGet());

//   final ApiGet apiGet = Get.find();
//   int intialIndex = 1;
//   setintialIndex(int index) {
//     this.intialIndex = index;
//     setState(() {});
//   }

//   DateTime currentBackPressTime;

//   Future<bool> onWillPop() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime) > Duration(seconds: 2)) {
//       currentBackPressTime = now;

//       Fluttertoast.showToast(
//           msg: "اضغط مره اخرى للخروج",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);

//       return Future.value(false);
//     }
//     return Future.value(true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,

//       endDrawer: CustomDrawer(),
//       // extendBodyBehindAppBar: true,
//       body: WillPopScope(
//         onWillPop: onWillPop,
//         child: Obx(() {
//           return Stack(
//             children: [
//               Column(
//                 children: [
//                   apiGet.mapProfile.isEmpty
//                       ? loading()
//                       : CachedNetworkImageShare(
//                           apiGet.mapProfile['userprofile'][0]['osra_user']
//                               ['image'],
//                           220,
//                           0,
//                           1),
//                   SizedBox(
//                     height: 105.h,
//                   ),
//                   Expanded(
//                     child: DefaultTabController(
//                       length: 2,
//                       initialIndex: intialIndex,
//                       child: Container(
//                         child: Column(
//                           children: [
//                             TabBar(
//                               unselectedLabelColor: blackColor,
//                               labelColor: orangeColor,
//                               indicatorWeight: 2,
//                               tabs: [
//                                 Tab(
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       apiGet.osraNewsOrderMap.length == 0
//                                           ? Container()
//                                           : Row(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 6,
//                                                       vertical: 2),
//                                                   decoration: BoxDecoration(
//                                                       shape: BoxShape.circle,
//                                                       color: Colors.red),
//                                                   alignment: Alignment.center,
//                                                   child: Text(
//                                                     '${apiGet.osraNewsOrderMap.length}',
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                       Text(
//                                         "الطلبات  ",
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Tab(
//                                   child: Text(
//                                     "الاطباق ",
//                                   ),
//                                 ),
//                               ],
//                               indicatorColor: orangeColor,
//                               labelStyle: getStyle(
//                                 orangeColor,
//                                 FontWeight.w700,
//                                 18,
//                               ),
//                               unselectedLabelStyle: getStyle(
//                                 blackColor,
//                                 FontWeight.w300,
//                                 18,
//                               ),
//                               onTap: (index) {
//                                 Server.server.getosraproduct();
//                                 appGet.setCurentStep(0);
//                                 appGet.setShowDetailsOrders(false);

//                                 Server.server.requestforosra();
//                               },
//                             ),
//                             Expanded(
//                               child: TabBarView(
//                                 children: [
//                                   // Obx(() {
//                                   // return
//                                   getOrders(context, apiGet),
//                                   // }),
//                                   Obx(() {
//                                     return Container(
//                                       padding: EdgeInsets.all(0),
//                                       child: ListView(
//                                         padding: EdgeInsets.all(0),
//                                         children: [
//                                           Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               // apiGet.osraNewsOrderMap.length == 0
//                                               //     ? Container()
//                                               //     : Directionality(
//                                               //         textDirection:
//                                               //             TextDirection.rtl,
//                                               //         child: Container(
//                                               //           color: orangeColor
//                                               //               .withOpacity(0.23),
//                                               //           child: ExpansionTile(
//                                               //             childrenPadding:
//                                               //                 EdgeInsets.all(0),
//                                               //             leading: Text(
//                                               //               "طلبات جديده ",
//                                               //               textAlign:
//                                               //                   TextAlign.right,
//                                               //               style: getStyle(
//                                               //                   blackColor,
//                                               //                   FontWeight.w700,
//                                               //                   18),
//                                               //             ),
//                                               //             title: Row(
//                                               //               children: [
//                                               //                 Container(
//                                               //                   height:
//                                               //                       ScreenUtil()
//                                               //                           .setHeight(
//                                               //                               25),
//                                               //                   width:
//                                               //                       ScreenUtil()
//                                               //                           .setWidth(
//                                               //                               25),
//                                               //                   decoration:
//                                               //                       BoxDecoration(
//                                               //                     color:
//                                               //                         whiteColor,
//                                               //                     shape: BoxShape
//                                               //                         .circle,
//                                               //                   ),
//                                               //                   child: Center(
//                                               //                     child: Text(
//                                               //                       '${apiGet.osraNewsOrderMap.length}',
//                                               //                       textAlign:
//                                               //                           TextAlign
//                                               //                               .right,
//                                               //                       style: getStyle(
//                                               //                           blackColor,
//                                               //                           FontWeight
//                                               //                               .normal,
//                                               //                           18),
//                                               //                     ),
//                                               //                   ),
//                                               //                 ),
//                                               //               ],
//                                               //             ),
//                                               //             children: apiGet
//                                               //                 .osraNewsOrderMap
//                                               //                 .map((e) {
//                                               //               return ListTile(
//                                               //                 leading: Text(
//                                               //                   "طلب جديده ",
//                                               //                   textAlign:
//                                               //                       TextAlign
//                                               //                           .right,
//                                               //                   style: getStyle(
//                                               //                       blackColor,
//                                               //                       FontWeight
//                                               //                           .w700,
//                                               //                       16),
//                                               //                 ),
//                                               //                 onTap: () {
//                                               //                   print('');
//                                               //                   // Server.server
//                                               //                   // .orderDeailsosra(
//                                               //                   // '30');
//                                               //                   Server.server
//                                               //                       .orderDeailsosra(e[
//                                               //                               'id']
//                                               //                           .toString());
//                                               //                   // controller
//                                               //                   //     .setShowDetailsOrders(
//                                               //                   //         true);
//                                               //                   // controller
//                                               //                   //     .setCurentStep(1);
//                                               //                 },
//                                               //               );
//                                               //             }).toList(),
//                                               //           ),
//                                               //         ),
//                                               //       ),
//                                               // SizedBox(
//                                               //   height: 20.h,
//                                               // ),
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   Server.server
//                                                       .getosraproduct();
//                                                   Get.to(
//                                                       SeeAllProductsScreen());
//                                                 },
//                                                 child: Container(
//                                                   margin: EdgeInsets.symmetric(
//                                                       horizontal: 18.w),
//                                                   child: Align(
//                                                     alignment:
//                                                         Alignment.centerLeft,
//                                                     child: Text(
//                                                       "عرض الكل ",
//                                                       textAlign:
//                                                           TextAlign.right,
//                                                       style: getStyle(
//                                                           blackColor,
//                                                           FontWeight.w300,
//                                                           16.sp),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 11.h,
//                                               ),
//                                               apiGet.mapProductFamily.isEmpty
//                                                   ? loading()
//                                                   : SizedBox(
//                                                       height: ScreenUtil()
//                                                           .setHeight(70 *
//                                                               (apiGet
//                                                                           .mapProductFamily[
//                                                                               'osraproduct']
//                                                                           .length ==
//                                                                       1
//                                                                   ? 1.1
//                                                                   : apiGet.mapProductFamily['osraproduct']
//                                                                               .length ==
//                                                                           2
//                                                                       ? 2.1
//                                                                       : 3.1)),
//                                                       child: apiGet
//                                                                   .mapProductFamily[
//                                                                       'osraproduct']
//                                                                   .length ==
//                                                               0
//                                                           ? Center(
//                                                               child: Text(
//                                                                 'لا يوجد منتجات',
//                                                               ),
//                                                             )
//                                                           : ListView.separated(
//                                                               separatorBuilder:
//                                                                   (context,
//                                                                       index) {
//                                                                 return CustomDivider();
//                                                               },
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(0),
//                                                               physics:
//                                                                   NeverScrollableScrollPhysics(),
//                                                               shrinkWrap: true,
//                                                               itemCount: apiGet
//                                                                   .mapProductFamily[
//                                                                       'osraproduct']
//                                                                   .length,
//                                                               itemBuilder:
//                                                                   (context,
//                                                                       index) {
//                                                                 return GestureDetector(
//                                                                   onTap: () {
//                                                                     Get.to(ProductDetailsScreen(
//                                                                         apiGet.mapProductFamily['osraproduct']
//                                                                             [
//                                                                             index]));
//                                                                   },
//                                                                   child:
//                                                                       Slidable(
//                                                                     actionPane:
//                                                                         SlidableDrawerActionPane(),
//                                                                     actionExtentRatio:
//                                                                         0.25,
//                                                                     child:
//                                                                         Container(
//                                                                       color: Colors
//                                                                           .white,
//                                                                       child:
//                                                                           CardFood(
//                                                                         map: apiGet.mapProductFamily['osraproduct']
//                                                                             [
//                                                                             index],
//                                                                       ),
//                                                                     ),
//                                                                     actions: <
//                                                                         Widget>[
//                                                                       Padding(
//                                                                         padding: EdgeInsets.only(
//                                                                             top:
//                                                                                 ScreenUtil().setHeight(5),
//                                                                             bottom: ScreenUtil().setHeight(10)),
//                                                                         child:
//                                                                             ClipRRect(
//                                                                           borderRadius:
//                                                                               getBoarderRadius(10),
//                                                                           child:
//                                                                               IconSlideAction(
//                                                                             color:
//                                                                                 Color(0xfff3f3f3),
//                                                                             iconWidget:
//                                                                                 Icon(
//                                                                               Icons.delete_forever,
//                                                                               color: redColor,
//                                                                             ),
//                                                                             onTap:
//                                                                                 () {
//                                                                               Server.server.deleteosraproduct(apiGet.mapProductFamily['osraproduct'][index]['id'].toString());
//                                                                             },
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 );
//                                                               },
//                                                             ),
//                                                     ),
//                                               SizedBox(
//                                                 height: 16.h,
//                                               ),
//                                               // Center(
//                                               //   child: Container(
//                                               //     margin: EdgeInsets.symmetric(
//                                               //         horizontal: 15.w),
//                                               //     child: Text(
//                                               //       "عروض ",
//                                               //       textAlign: TextAlign.right,
//                                               //       style: getStyle(orangeColor,
//                                               //           FontWeight.w700, 18.sp),
//                                               //     ),
//                                               //   ),
//                                               // ),
//                                               // SizedBox(
//                                               //   height: 15.h,
//                                               // ),
//                                               // Obx(() {
//                                               //   return apiGet.offersMap.isEmpty
//                                               //       ? loading()
//                                               //       : SliderScreen(
//                                               //           offersList:
//                                               //               apiGet.offersMap[
//                                               //                   'product'],
//                                               //         );
//                                               // }),
//                                               SizedBox(
//                                                 height:
//                                                     ScreenUtil().setWidth(30),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   }),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: SizedBox(
//                     height: ScreenUtil().setHeight(100),
//                     child: AppBar(
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       automaticallyImplyLeading: false,
//                       // actions: [
//                       //   Icon(Icons.arrow_forward),
//                       // ],
//                       leading: Padding(
//                         padding: EdgeInsets.all(15),
//                         child: GetBuilder<ApiGet>(
//                           id: 'notification',
//                           init: ApiGet(),
//                           initState: (_) {},
//                           builder: (_) {
//                             return GestureDetector(
//                               onTap: () {
//                                 _.changeNumberNotificationOsra();
//                                 Server.server.getAllrequestforuser();
//                                 Get.to(NotificationFamilyScreen());
//                               },
//                               child: GetBuilder<ApiGet>(
//                                 init: ApiGet(),
//                                 id: 'notification',
//                                 initState: (_) {},
//                                 builder: (_) {
//                                   return Stack(
//                                     children: [
//                                       Icon(
//                                         FontAwesomeIcons.solidBell,
//                                         color: whiteColor,
//                                       ),
//                                       _.numberNotificationOsra == 0
//                                           ? Container()
//                                           : Positioned(
//                                               top: 0.0,
//                                               right: 0,
//                                               child: Container(
//                                                 padding: EdgeInsets.all(1),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.red,
//                                                   borderRadius:
//                                                       BorderRadius.circular(6),
//                                                 ),
//                                                 constraints: BoxConstraints(
//                                                   minWidth: 12,
//                                                   minHeight: 12,
//                                                 ),
//                                                 child: Text(
//                                                   '${_.numberNotificationOsra}',
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 8,
//                                                   ),
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                               ),
//                                             )
//                                     ],
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: ScreenUtil().setHeight(180),
//                 left: ScreenUtil().setWidth(25),
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Obx(() {
//                       return Container(
//                         height: ScreenUtil().setHeight(126),
//                         width: ScreenUtil().setWidth(339),
//                         decoration: BoxDecoration(
//                           color: whiteColor,
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(0.00, 3.00),
//                               color: blackColor.withOpacity(0.16),
//                               blurRadius: 6,
//                             ),
//                           ],
//                           borderRadius: getBoarderRadius(10.00),
//                         ),
//                         child: apiGet.mapProfile.isEmpty
//                             ? loading()
//                             : Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   SizedBox(
//                                     height: ScreenUtil().setHeight(12),
//                                   ),
//                                   Text(
//                                     apiGet.mapProfile['userprofile'][0]['name']
//                                         .toString(),
//                                     textAlign: TextAlign.right,
//                                     style: getStyle(
//                                         blackColor, FontWeight.w700, 18),
//                                   ),
//                                   SizedBox(
//                                     height: ScreenUtil().setHeight(12),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       apiGet
//                                                   .mapProfile['userprofile'][0]
//                                                       ['osra_user']['address']
//                                                   .length >
//                                               10
//                                           ? Expanded(
//                                               child: Text(
//                                                 apiGet.mapProfile['userprofile']
//                                                                 [0]['osra_user']
//                                                             ['address'] ==
//                                                         null
//                                                     ? 'لا يوجد عنوان'
//                                                     : apiGet.mapProfile[
//                                                             'userprofile'][0]
//                                                             ['osra_user']
//                                                             ['address']
//                                                         .toString(),
//                                                 textAlign: TextAlign.right,
//                                                 style: getStyle(blackColor,
//                                                     FontWeight.w300, 16),
//                                               ),
//                                             )
//                                           : Text(
//                                               apiGet.mapProfile['userprofile']
//                                                               [0]['osra_user']
//                                                           ['address'] ==
//                                                       null
//                                                   ? 'لا يوجد عنوان'
//                                                   : apiGet
//                                                       .mapProfile['userprofile']
//                                                           [0]['osra_user']
//                                                           ['address']
//                                                       .toString(),
//                                               textAlign: TextAlign.right,
//                                               style: getStyle(blackColor,
//                                                   FontWeight.w300, 16),
//                                             ),
//                                       SizedBox(width: ScreenUtil().setWidth(5)),
//                                       Icon(
//                                         FontAwesomeIcons.mapMarkerAlt,
//                                         color: orange2Color,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: ScreenUtil().setHeight(12),
//                                   ),
//                                   Expanded(
//                                     child: Row(
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.bottomLeft,
//                                           child: Container(
//                                             height: ScreenUtil().setHeight(41),
//                                             width: ScreenUtil().setWidth(96),
//                                             decoration: BoxDecoration(
//                                               color: apiGet.mapProfile[
//                                                               'userprofile'][0]
//                                                           ['isopen'] ==
//                                                       null
//                                                   ? greenColor
//                                                   : apiGet.mapProfile[
//                                                                   'userprofile']
//                                                               [0]['isopen'] ==
//                                                           '1'
//                                                       ? greenColor
//                                                       : redColor,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   offset: Offset(0.00, 3.00),
//                                                   color: blackColor
//                                                       .withOpacity(0.16),
//                                                   blurRadius: 6,
//                                                 ),
//                                               ],
//                                               borderRadius: BorderRadius.only(
//                                                 topRight:
//                                                     Radius.circular(10.00),
//                                                 bottomLeft:
//                                                     Radius.circular(10.00),
//                                               ),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 apiGet.mapProfile['userprofile']
//                                                             [0]['isopen'] ==
//                                                         null
//                                                     ? "مفتوح"
//                                                     : apiGet.mapProfile[
//                                                                     'userprofile']
//                                                                 [0]['isopen'] ==
//                                                             '1'
//                                                         ? "مفتوح"
//                                                         : "مغلق",
//                                                 textAlign: TextAlign.right,
//                                                 style: getStyle(whiteColor,
//                                                     FontWeight.w700, 18),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             width: ScreenUtil().setWidth(20)),
//                                         Directionality(
//                                           textDirection: TextDirection.rtl,
//                                           child: RatingBar.readOnly(
//                                             initialRating:
//                                                 apiGet.mapProfile['userprofile']
//                                                             [0]['rate'] ==
//                                                         null
//                                                     ? 0.0
//                                                     : double.parse(apiGet
//                                                                 .mapProfile[
//                                                             'userprofile'][0]
//                                                         ['rate']),
//                                             isHalfAllowed: true,
//                                             halfFilledIcon: Icons.star_half,
//                                             filledIcon: Icons.star,
//                                             emptyIcon: Icons.star_border,
//                                             filledColor: orangeColor,
//                                             size: 20,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                       );
//                     }),
//                     Positioned(
//                       top: -ScreenUtil().setHeight(15),
//                       right: ScreenUtil().setWidth(8),
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(AppNewProducts());
//                         },
//                         child: Column(
//                           children: [
//                             Container(
//                               height: ScreenUtil().setHeight(28),
//                               width: ScreenUtil().setWidth(28),
//                               decoration: BoxDecoration(
//                                 color: orangeColor,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     offset: Offset(0.00, 3.00),
//                                     color: blackColor.withOpacity(0.16),
//                                     blurRadius: 6,
//                                   ),
//                                 ],
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Icon(
//                                 Icons.add,
//                                 color: whiteColor,
//                               ),
//                             ),
//                             Text(
//                               "إضافة منتج",
//                               textAlign: TextAlign.right,
//                               style: getStyle(blackColor, FontWeight.w300, 14),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           );
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           FireBaseHelper.fireBaseHelper.getAllMyChats(
//               myId: apiGet.mapProfile['userprofile'][0]['jawwal']);
//           Get.to(MyChatsScreen());

//           apiGet.testChat();
//         },
//         child: Padding(
//           padding: EdgeInsets.all(5),
//           child: GetBuilder<ApiGet>(
//             id: 'notification',
//             init: ApiGet(),
//             initState: (_) {},
//             builder: (_) {
//               return GetBuilder<ApiGet>(
//                 init: ApiGet(),
//                 id: 'notification',
//                 initState: (_) {},
//                 builder: (_) {
//                   return Stack(
//                     children: [
//                       SvgPicture.asset(
//                         chattingSvg,
//                       ),
//                       _.countMessageUnRead == 0
//                           ? Container()
//                           : Positioned(
//                               top: 0.0,
//                               right: 0,
//                               child: Container(
//                                 padding: EdgeInsets.all(1),
//                                 decoration: BoxDecoration(
//                                   color: Colors.red,
//                                   borderRadius: BorderRadius.circular(6),
//                                 ),
//                                 constraints: BoxConstraints(
//                                   minWidth: 12,
//                                   minHeight: 12,
//                                 ),
//                                 child: Text(
//                                   '${_.countMessageUnRead}',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             )
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//     );
//   }
// }

// Widget getOrders(BuildContext context, ApiGet apiGet) {
//   const stepIcons = [
//     Icons.ac_unit,
//     Icons.ac_unit,
//     Icons.ac_unit,
//     Icons.ac_unit,
//   ];

//   final List<String> titles = [
//     "طلب جديد",
//     "قيد التحضير ",
//     '''    تم التحضير    
// في انتظار التوصيل''',
//     "تم التسليم ",
//   ];
//   final List<String> titles2 = [
//     "طلب جديد",
//     "قيد التحضير ",
//     " تم التسليم ",
//   ];
//   String timeOrderOsra;

//   // appFamilyGet.setCurentStep(3);

//   ApiGet apiGet = Get.find();

//   return Container(
//     child: GetBuilder<AppFamilyGet>(
//         init: AppFamilyGet(),
//         id: 'stepper',
//         builder: (controller) {
//           return Obx(() {
//             return Column(
//               children: [
//                 controller.showDetailsOrders
//                     ? Container()
//                     : apiGet.osraNewsOrderMap.length == 0
//                         ? Container()
//                         : Directionality(
//                             textDirection: TextDirection.rtl,
//                             child: Container(
//                               color: orangeColor.withOpacity(0.23),
//                               child: ExpansionTile(
//                                 childrenPadding: EdgeInsets.all(0),
//                                 leading: Text(
//                                   "طلبات جديده ",
//                                   textAlign: TextAlign.right,
//                                   style:
//                                       getStyle(blackColor, FontWeight.w700, 18),
//                                 ),
//                                 title: Row(
//                                   children: [
//                                     Container(
//                                       height: ScreenUtil().setHeight(25),
//                                       width: ScreenUtil().setWidth(25),
//                                       decoration: BoxDecoration(
//                                         color: whiteColor,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           '${apiGet.osraNewsOrderMap.length}',
//                                           textAlign: TextAlign.right,
//                                           style: getStyle(blackColor,
//                                               FontWeight.normal, 18),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 children: apiGet.osraNewsOrderMap.map((e) {
//                                   return ListTile(
//                                     leading: Text(
//                                       "طلبات جديده ",
//                                       textAlign: TextAlign.right,
//                                       style: getStyle(
//                                           blackColor, FontWeight.w700, 16),
//                                     ),
//                                     onTap: () {
//                                       Server.server.orderDeailsosra(
//                                         e['id'].toString(),
//                                       );

//                                       controller.setShowDetailsOrders(true);
//                                       controller.setCurentStep(1);
//                                     },
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                 Expanded(
//                   child:
//                       controller.curStep == 0 ||
//                               controller.curStep == 5 ||
//                               !controller.showDetailsOrders
//                           ? apiGet.osraOrderMap.length == 0
//                               ? Center(
//                                   child: Text('لا يوجد طلبات'),
//                                 )
//                               : ListView.separated(
//                                   itemCount: apiGet.osraOrderMap.length + 1,
//                                   // reverse: true,
//                                   separatorBuilder: (context, index) {
//                                     Map map = apiGet.osraOrderMap[index];
//                                     return ListTile(
//                                       onTap: () {
//                                         apiGet.osraOrderDeyailsMap
//                                             .assignAll({});
//                                         if (map['is_approved'] == '5') {
//                                         } else {
//                                           controller.setCurentStep(int.parse(
//                                               map['status'] == '2' ||
//                                                       map['status'] == '3' ||
//                                                       map['status'] == '4'
//                                                   ? map['status']
//                                                   : '4'));
//                                           controller.setShowDetailsOrders(true);

//                                           Server.server.orderDeailsosra(
//                                               map['id'].toString());
//                                         }
//                                       },
//                                       trailing: Text(
//                                         map['status'] == '2'
//                                             ? "طلب قيد التحضير "
//                                             : map['status'] == '3' ||
//                                                     map['status'] == '10'
//                                                 ? "طلب تم تحضيره "
//                                                 : map['status'] == '4'
//                                                     ? "طلب تم تسليمه للمندوب"
//                                                     : map['status'] == '7' ||
//                                                             map['status'] ==
//                                                                 '9' ||
//                                                             map['status'] == '6'
//                                                         ? 'طلب تم تسليمه للعميل '
//                                                         : map['is_approved'] ==
//                                                                     '5' ||
//                                                                 map['status'] ==
//                                                                     '8'
//                                                             ? ' طلب تم إلغائه من الزبون'
//                                                             : map['status'] ==
//                                                                     '5'
//                                                                 ? ' طلب تم إلغائه من الديلفري'
//                                                                 : '',
//                                         textAlign: TextAlign.right,
//                                         style: getStyle(
//                                             blackColor, FontWeight.w300, 18),
//                                       ),
//                                       // leading: Container(
//                                       //   height: ScreenUtil().setHeight(30),
//                                       //   width: ScreenUtil().setWidth(30),
//                                       //   decoration: BoxDecoration(
//                                       //     color: orangeColor.withOpacity(0.23),
//                                       //     shape: BoxShape.circle,
//                                       //   ),
//                                       //   child: Center(
//                                       //     child: Text(
//                                       //       "2",
//                                       //       textAlign: TextAlign.right,
//                                       //       style: getStyle(blackColor,
//                                       //           FontWeight.normal, 18),
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                     );
//                                   },
//                                   itemBuilder: (context, index) {
//                                     return CustomDivider();
//                                   },
//                                 )
//                           : Obx(() {
//                               return Directionality(
//                                 textDirection: TextDirection.rtl,
//                                 child: apiGet.osraOrderDeyailsMap.isEmpty
//                                     ? loading()
//                                     : apiGet.osraOrderDeyailsMap['purchase']
//                                                 .length ==
//                                             0
//                                         ? Container()
//                                         : apiGet.osraOrderDeyailsMap['purchase']
//                                                         [0]['delivery_type']
//                                                     .toString() ==
//                                                 '1'
//                                             ? Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   StepProgressView(
//                                                     icons: stepIcons,
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     curStep:
//                                                         controller.curStep + 1,
//                                                     color: orangeColor,
//                                                     titles: titles,
//                                                   ),
//                                                   controller.curStep == 1
//                                                       ? Obx(() {
//                                                           return Expanded(
//                                                             child: Container(
//                                                               margin: EdgeInsets.symmetric(
//                                                                   horizontal:
//                                                                       ScreenUtil()
//                                                                           .setWidth(
//                                                                               10)),
//                                                               child: ListView(
//                                                                 children: [
//                                                                   Column(
//                                                                     crossAxisAlignment:
//                                                                         CrossAxisAlignment
//                                                                             .start,
//                                                                     children: [
//                                                                       Container(
//                                                                         height:
//                                                                             apiGet.osraOrderDeyailsMap['purchase'].length * 50.0 +
//                                                                                 50,
//                                                                         child: ListView
//                                                                             .builder(
//                                                                           itemCount: apiGet
//                                                                               .osraOrderDeyailsMap['purchase']
//                                                                               .length,
//                                                                           itemBuilder:
//                                                                               (BuildContext context, int index) {
//                                                                             List
//                                                                                 extraList =
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][index]['extra'];
//                                                                             return ExpansionTile(
//                                                                               childrenPadding: EdgeInsets.all(0),
//                                                                               leading: Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][index]['subproductname'],
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                               title: Container(
//                                                                                 height: ScreenUtil().setHeight(25),
//                                                                                 decoration: BoxDecoration(
//                                                                                   color: whiteColor,
//                                                                                   shape: BoxShape.circle,
//                                                                                 ),
//                                                                                 child: Center(
//                                                                                   child: Text(
//                                                                                     ' ${apiGet.osraOrderDeyailsMap['purchase'][index]['quantity']} عدد ',
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               children: extraList.length ==
//                                                                                       0
//                                                                                   ? [
//                                                                                       Text('لا يوجد إضافات')
//                                                                                     ]
//                                                                                   : extraList.map((e) {
//                                                                                       return ListTile(
//                                                                                         leading: Text(
//                                                                                           e['name'],
//                                                                                           textAlign: TextAlign.right,
//                                                                                           style: getStyle(blackColor, FontWeight.w700, 16),
//                                                                                         ),
//                                                                                       );
//                                                                                     }).toList(),
//                                                                             );
//                                                                           },
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(10)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 Icons.person,
//                                                                                 color: grayColor,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['jawwal'],
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(10)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 Icons.person,
//                                                                                 color: grayColor,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['name'],
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),

//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.moneyBill,
//                                                                                 color: grayColor,
//                                                                                 size: 20,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() != '1' ? "استلام شخصي" : "توصيل مندوب",
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),

//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.moneyBill,
//                                                                                 color: grayColor,
//                                                                                 size: 20,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['is_cash'].toString() != '1' ? "الدفع أونلاين" : "الدفع عند الاستلام",
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           Text(
//                                                                             apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() == '1'
//                                                                                 ? '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price']) + double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['cost_delivery'])).toStringAsFixed(2)} ريال '
//                                                                                 : '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])).toStringAsFixed(2)} ريال ',
//                                                                             textAlign:
//                                                                                 TextAlign.right,
//                                                                             style: getStyle(
//                                                                                 blackColor,
//                                                                                 FontWeight.w300,
//                                                                                 18),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.moneyBill,
//                                                                                 color: grayColor,
//                                                                                 size: 20,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 'سعر الأطباق',
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           Text(
//                                                                             '${double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])} ريال ',
//                                                                             textAlign:
//                                                                                 TextAlign.right,
//                                                                             style: getStyle(
//                                                                                 blackColor,
//                                                                                 FontWeight.w300,
//                                                                                 18),
//                                                                           ),
//                                                                         ],
//                                                                       ),

//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.mapMarkerAlt,
//                                                                                 color: grayColor,
//                                                                               ),
//                                                                               // SizedBox(
//                                                                               //   width: ScreenUtil().setWidth(10),
//                                                                               // ),

//                                                                               apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].length > 10
//                                                                                   ? Expanded(
//                                                                                       child: Text(
//                                                                                         apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'],
//                                                                                         textAlign: TextAlign.right,
//                                                                                         overflow: TextOverflow.ellipsis,
//                                                                                         style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                       ),
//                                                                                     )
//                                                                                   : Text(
//                                                                                       apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'],
//                                                                                       textAlign: TextAlign.right,
//                                                                                       overflow: TextOverflow.ellipsis,
//                                                                                       style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                     ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Padding(
//                                                                         padding:
//                                                                             const EdgeInsets.all(8.0),
//                                                                         child:
//                                                                             CustomButton(
//                                                                           title:
//                                                                               'أوافق',
//                                                                           onTap:
//                                                                               () {
//                                                                             FocusScope.of(context).unfocus();

//                                                                             Get.bottomSheet(SizedBox(
//                                                                               height: ScreenUtil().setHeight(406),
//                                                                               width: ScreenUtil().setWidth(375),
//                                                                               child: Container(
//                                                                                 padding: EdgeInsets.all(20),
//                                                                                 decoration: BoxDecoration(
//                                                                                   color: whiteColor,
//                                                                                   boxShadow: [
//                                                                                     BoxShadow(
//                                                                                       offset: Offset(0.00, 3.00),
//                                                                                       color: blackColor.withOpacity(0.16),
//                                                                                       blurRadius: 6,
//                                                                                     ),
//                                                                                   ],
//                                                                                   borderRadius: BorderRadius.only(
//                                                                                     topLeft: Radius.circular(20.00),
//                                                                                     topRight: Radius.circular(20.00),
//                                                                                   ),
//                                                                                 ),
//                                                                                 child: Column(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                   children: [
//                                                                                     Text(
//                                                                                       "الوقت المطلوب لتحضير الطلب ",
//                                                                                       textAlign: TextAlign.right,
//                                                                                       style: getStyle(blackColor, FontWeight.w700, 20),
//                                                                                     ),
//                                                                                     Column(
//                                                                                       crossAxisAlignment: CrossAxisAlignment.end,
//                                                                                       children: [
//                                                                                         Align(
//                                                                                           alignment: Alignment.centerRight,
//                                                                                           child: Text(
//                                                                                             "يحتاج تحضير الطلب ",
//                                                                                             textAlign: TextAlign.right,
//                                                                                             style: getStyle(blackColor, FontWeight.normal, 18),
//                                                                                           ),
//                                                                                         ),
//                                                                                         SizedBox(height: ScreenUtil().setHeight(15)),
//                                                                                         Container(
//                                                                                           height: ScreenUtil().setHeight(55),
//                                                                                           width: ScreenUtil().setWidth(170),
//                                                                                           decoration: BoxDecoration(
//                                                                                             border: Border.all(
//                                                                                               width: 0.50,
//                                                                                               color: blackOpacityColor,
//                                                                                             ),
//                                                                                             borderRadius: BorderRadius.circular(18),
//                                                                                           ),
//                                                                                           child: ClipRRect(
//                                                                                             borderRadius: BorderRadius.circular(18),
//                                                                                             child: Row(
//                                                                                               children: [
//                                                                                                 Container(
//                                                                                                   padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
//                                                                                                   child: Center(
//                                                                                                     child: Text(
//                                                                                                       "دقيقة",
//                                                                                                       textAlign: TextAlign.right,
//                                                                                                       style: getStyle(blackColor, FontWeight.w700, 18),
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 ),
//                                                                                                 VerticalDivider(
//                                                                                                   thickness: 1,
//                                                                                                 ),
//                                                                                                 Expanded(
//                                                                                                   child: TextFormField(
//                                                                                                     keyboardType: TextInputType.number,
//                                                                                                     onChanged: (value) {
//                                                                                                       timeOrderOsra = value;
//                                                                                                     },
//                                                                                                     decoration: InputDecoration(
//                                                                                                       contentPadding: const EdgeInsets.only(top: 10.0, bottom: 5, left: 10, right: 10),
//                                                                                                       fillColor: whiteColor,
//                                                                                                       filled: true,
//                                                                                                       border: InputBorder.none,
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ],
//                                                                                             ),
//                                                                                           ),
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                     CustomButton(
//                                                                                       title: 'التالي',
//                                                                                       onTap: () {
//                                                                                         FocusScope.of(context).unfocus();
//                                                                                         if (timeOrderOsra == null || timeOrderOsra == '') {
//                                                                                           getSheetError('الرجاء كتابة الوقت ');
//                                                                                         } else {
//                                                                                           Server.server.approvedorder(apiGet.osraOrderDeyailsMap['purchase'][0]['request_id'].toString(), '1', timeOrderOsra);
//                                                                                           controller.setCurentStep(2);
//                                                                                         }
//                                                                                       },
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ));
//                                                                           },
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(5)),
//                                                                       // Padding(
//                                                                       //   padding:
//                                                                       //       EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(8)),
//                                                                       //   child:
//                                                                       //       CustomButton(
//                                                                       //     title:
//                                                                       //         'لا أوافق',
//                                                                       //     colorButton:
//                                                                       //         whiteColor,
//                                                                       //     onTap:
//                                                                       //         () {
//                                                                       //       FocusScope.of(context).unfocus();

//                                                                       //       Server.server.approvedorder(
//                                                                       //           apiGet.osraOrderDeyailsMap['purchase'][0]['request_id'].toString(),
//                                                                       //           '5',
//                                                                       //           '0');
//                                                                       //       appGet.setShowDetailsOrders(false);
//                                                                       //     },
//                                                                       //   ),
//                                                                       // ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(10)),
//                                                                     ],
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           );
//                                                         })
//                                                       : controller.curStep == 2
//                                                           ? Obx(() {
//                                                               return Expanded(
//                                                                   child:
//                                                                       Container(
//                                                                 margin: EdgeInsets.symmetric(
//                                                                     horizontal:
//                                                                         ScreenUtil()
//                                                                             .setWidth(10)),
//                                                                 child: ListView(
//                                                                   children: [
//                                                                     Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         Container(
//                                                                           height:
//                                                                               apiGet.osraOrderDeyailsMap['purchase'].length * 50.0 + 50,
//                                                                           child:
//                                                                               ListView.builder(
//                                                                             itemCount:
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'].length,
//                                                                             itemBuilder:
//                                                                                 (BuildContext context, int index) {
//                                                                               List extraList = apiGet.osraOrderDeyailsMap['purchase'][index]['extra'];
//                                                                               return ExpansionTile(
//                                                                                 childrenPadding: EdgeInsets.all(0),
//                                                                                 leading: Text(
//                                                                                   apiGet.osraOrderDeyailsMap['purchase'][index]['subproductname'],
//                                                                                   textAlign: TextAlign.right,
//                                                                                   style: getStyle(blackColor, FontWeight.normal, 18),
//                                                                                 ),
//                                                                                 title: Container(
//                                                                                   height: ScreenUtil().setHeight(25),
//                                                                                   decoration: BoxDecoration(
//                                                                                     color: whiteColor,
//                                                                                     shape: BoxShape.circle,
//                                                                                   ),
//                                                                                   child: Center(
//                                                                                     child: Text(
//                                                                                       ' ${apiGet.osraOrderDeyailsMap['purchase'][index]['quantity']} عدد ',
//                                                                                       textAlign: TextAlign.right,
//                                                                                       style: getStyle(blackColor, FontWeight.normal, 18),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 children: extraList.length ==
//                                                                                         0
//                                                                                     ? [
//                                                                                         Text('لا يوجد إضافات')
//                                                                                       ]
//                                                                                     : extraList.map((e) {
//                                                                                         return ListTile(
//                                                                                           leading: Text(
//                                                                                             e['name'],
//                                                                                             textAlign: TextAlign.right,
//                                                                                             style: getStyle(blackColor, FontWeight.w700, 16),
//                                                                                           ),
//                                                                                         );
//                                                                                       }).toList(),
//                                                                               );
//                                                                             },
//                                                                           ),
//                                                                         ),
//                                                                         Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Row(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   Icons.person,
//                                                                                   color: grayColor,
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                                 Text(
//                                                                                   apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['jawwal'],
//                                                                                   textAlign: TextAlign.right,
//                                                                                   style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(10)),
//                                                                         Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Row(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   Icons.person,
//                                                                                   color: grayColor,
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                                 Text(
//                                                                                   apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['name'],
//                                                                                   textAlign: TextAlign.right,
//                                                                                   style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20)),
//                                                                         Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Row(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   FontAwesomeIcons.moneyBill,
//                                                                                   color: grayColor,
//                                                                                   size: 20,
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                                 Text(
//                                                                                   apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() != '1' ? "استلام شخصي" : "توصيل مندوب",
//                                                                                   textAlign: TextAlign.right,
//                                                                                   style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20)),
//                                                                         Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Row(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   FontAwesomeIcons.moneyBill,
//                                                                                   color: grayColor,
//                                                                                   size: 20,
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                                 Text(
//                                                                                   // delivery_type
//                                                                                   apiGet.osraOrderDeyailsMap['purchase'][0]['is_cash'].toString() != '1' ? "الدفع أونلاين" : "الدفع عند الاستلام",
//                                                                                   textAlign: TextAlign.right,
//                                                                                   style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                             Text(
//                                                                               apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() == '1' ? '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price']) + double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['cost_delivery'])).toStringAsFixed(2)} ريال ' : '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])).toStringAsFixed(2)} ريال ',
//                                                                               textAlign: TextAlign.right,
//                                                                               style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20)),
//                                                                         Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Row(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   FontAwesomeIcons.moneyBill,
//                                                                                   color: grayColor,
//                                                                                   size: 20,
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                                 Text(
//                                                                                   'سعر الأطباق',
//                                                                                   textAlign: TextAlign.right,
//                                                                                   style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   width: ScreenUtil().setWidth(10),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                             Text(
//                                                                               '${double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])} ريال ',
//                                                                               textAlign: TextAlign.right,
//                                                                               style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20)),
//                                                                         Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Row(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   FontAwesomeIcons.mapMarkerAlt,
//                                                                                   color: grayColor,
//                                                                                 ),
//                                                                                 // SizedBox(
//                                                                                 //   width: ScreenUtil().setWidth(10),
//                                                                                 // ),

//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].length > 10
//                                                                                     ? Expanded(
//                                                                                         child: Text(
//                                                                                           apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'],
//                                                                                           textAlign: TextAlign.right,
//                                                                                           overflow: TextOverflow.ellipsis,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                         ),
//                                                                                       )
//                                                                                     : Text(
//                                                                                         apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'],
//                                                                                         textAlign: TextAlign.right,
//                                                                                         overflow: TextOverflow.ellipsis,
//                                                                                         style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                       ),
//                                                                               ],
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20)),
//                                                                         Padding(
//                                                                           padding:
//                                                                               EdgeInsets.all(8.0),
//                                                                           child:
//                                                                               CustomButton(
//                                                                             title:
//                                                                                 'تم التحضير',
//                                                                             onTap:
//                                                                                 () {
//                                                                               Server.server.changeorder(apiGet.osraOrderDeyailsMap['purchase'][0]['request_id'].toString(), '3');
//                                                                               apiGet.osraOrderDeyailsMap.assignAll({});
//                                                                               // controller
//                                                                               //     .setCurentStep(3);
//                                                                             },
//                                                                           ),
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20)),
//                                                                       ],
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ));
//                                                             })
//                                                           : Obx(() {
//                                                               return Expanded(
//                                                                 child:
//                                                                     Container(
//                                                                   margin: EdgeInsets.symmetric(
//                                                                       horizontal:
//                                                                           ScreenUtil()
//                                                                               .setWidth(10)),
//                                                                   child:
//                                                                       ListView(
//                                                                     children: [
//                                                                       Column(
//                                                                         crossAxisAlignment:
//                                                                             CrossAxisAlignment.start,
//                                                                         children: [
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     Icons.person,
//                                                                                     color: grayColor,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['jawwal'].toString(),
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: ScreenUtil().setHeight(20)),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.mapMarkerAlt,
//                                                                                     color: grayColor,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].length > 10
//                                                                                       ? Text(
//                                                                                           apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : '${apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].toString().substring(0, 17)}',
//                                                                                           textAlign: TextAlign.right,
//                                                                                           overflow: TextOverflow.ellipsis,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                         )
//                                                                                       : Text(
//                                                                                           apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'],
//                                                                                           textAlign: TextAlign.right,
//                                                                                           overflow: TextOverflow.ellipsis,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                         ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20),
//                                                                           ),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.moneyBill,
//                                                                                     color: grayColor,
//                                                                                     size: 20,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() != '1' ? "استلام شخصي" : "توصيل مندوب",
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: ScreenUtil().setHeight(20)),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.moneyBill,
//                                                                                     color: grayColor,
//                                                                                     size: 20,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][0]['is_cash'].toString() != '1' ? "الدفع أونلاين" : "الدفع عند الاستلام",
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() == '1' ? '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price']) + double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['cost_delivery'])).toStringAsFixed(2)} ريال ' : '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])).toStringAsFixed(2)} ريال ',
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20),
//                                                                           ),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.moneyBill,
//                                                                                     color: grayColor,
//                                                                                     size: 20,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     'سعر الأطباق',
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                               Text(
//                                                                                 '${double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])} ريال ',
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20),
//                                                                           ),

//                                                                           // Row(
//                                                                           //   mainAxisAlignment:
//                                                                           //       MainAxisAlignment
//                                                                           //           .spaceBetween,
//                                                                           //   children: [
//                                                                           //     Row(
//                                                                           //       children: [
//                                                                           //         Icon(
//                                                                           //           FontAwesomeIcons.hourglass,
//                                                                           //           color:
//                                                                           //               grayColor,
//                                                                           //           size:
//                                                                           //               24,
//                                                                           //         ),
//                                                                           //         SizedBox(
//                                                                           //           width:
//                                                                           //               ScreenUtil().setWidth(10),
//                                                                           //         ),
//                                                                           //         Text(
//                                                                           //           "وقت الطلب",
//                                                                           //           textAlign:
//                                                                           //               TextAlign.right,
//                                                                           //           style: getStyle(
//                                                                           //               blackColor,
//                                                                           //               FontWeight.w300,
//                                                                           //               18),
//                                                                           //         ),
//                                                                           //       ],
//                                                                           //     ),
//                                                                           //     Text(
//                                                                           //       "م 3:30",
//                                                                           //       textAlign:
//                                                                           //           TextAlign.right,
//                                                                           //       style: getStyle(
//                                                                           //           blackColor,
//                                                                           //           FontWeight.w300,
//                                                                           //           18),
//                                                                           //     ),
//                                                                           //   ],
//                                                                           // ),
//                                                                           // SizedBox(
//                                                                           //   height: ScreenUtil()
//                                                                           //       .setHeight(
//                                                                           //           20),
//                                                                           // ),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.hourglass,
//                                                                                     color: grayColor,
//                                                                                     size: 24,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     "وقت التوصيل",
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['end_request'].toString().split(' ')[1],
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(50),
//                                                                           ),
//                                                                           controller.curStep == 4
//                                                                               ? Container()
//                                                                               : CustomButton(
//                                                                                   title: 'تم تسليم المندوب',
//                                                                                   onTap: () {
//                                                                                     FocusScope.of(context).unfocus();
//                                                                                     FocusScope.of(context).unfocus();

//                                                                                     Server.server.changeorder(apiGet.osraOrderDeyailsMap['purchase'][0]['request_id'].toString(), '4');
//                                                                                     controller.setCurentStep(5);
//                                                                                     controller.setShowDetailsOrders(false);
//                                                                                   },
//                                                                                 ),
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               );
//                                                             }),
//                                                 ],
//                                               )
//                                             : Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   StepProgressView(
//                                                     icons: stepIcons,
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     curStep:
//                                                         controller.curStep + 1,
//                                                     color: orangeColor,
//                                                     titles: titles2,
//                                                   ),
//                                                   controller.curStep == 1
//                                                       ? Obx(() {
//                                                           return Expanded(
//                                                             child: Container(
//                                                               margin: EdgeInsets.symmetric(
//                                                                   horizontal:
//                                                                       ScreenUtil()
//                                                                           .setWidth(
//                                                                               10)),
//                                                               child: ListView(
//                                                                 children: [
//                                                                   Column(
//                                                                     crossAxisAlignment:
//                                                                         CrossAxisAlignment
//                                                                             .start,
//                                                                     children: [
//                                                                       Container(
//                                                                         height:
//                                                                             apiGet.osraOrderDeyailsMap['purchase'].length * 50.0 +
//                                                                                 50,
//                                                                         child: ListView
//                                                                             .builder(
//                                                                           itemCount: apiGet
//                                                                               .osraOrderDeyailsMap['purchase']
//                                                                               .length,
//                                                                           itemBuilder:
//                                                                               (BuildContext context, int index) {
//                                                                             List
//                                                                                 extraList =
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][index]['extra'];
//                                                                             return ExpansionTile(
//                                                                               childrenPadding: EdgeInsets.all(0),
//                                                                               leading: Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][index]['subproductname'],
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w700, 18),
//                                                                               ),
//                                                                               title: Container(
//                                                                                 height: ScreenUtil().setHeight(25),
//                                                                                 decoration: BoxDecoration(
//                                                                                   color: whiteColor,
//                                                                                   shape: BoxShape.circle,
//                                                                                 ),
//                                                                                 child: Center(
//                                                                                   child: Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][index]['quantity'].toString() == '1' ? 'طبق واحد ' : ' ${apiGet.osraOrderDeyailsMap['purchase'][index]['quantity']} أطباق ',
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.normal, 18),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               children: extraList.length ==
//                                                                                       0
//                                                                                   ? [
//                                                                                       Text('لا يوجد إضافات')
//                                                                                     ]
//                                                                                   : extraList.map((e) {
//                                                                                       return ListTile(
//                                                                                         leading: Text(
//                                                                                           e['name'],
//                                                                                           textAlign: TextAlign.right,
//                                                                                           style: getStyle(blackColor, FontWeight.w700, 16),
//                                                                                         ),
//                                                                                       );
//                                                                                     }).toList(),
//                                                                             );
//                                                                           },
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 Icons.person,
//                                                                                 color: grayColor,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['jawwal'],
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.moneyBill,
//                                                                                 color: grayColor,
//                                                                                 size: 20,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() != '1' ? "استلام شخصي" : "توصيل مندوب",
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.moneyBill,
//                                                                                 color: grayColor,
//                                                                                 size: 20,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['is_cash'].toString() != '1' ? "الدفع أونلاين" : "الدفع عند الاستلام",
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           Text(
//                                                                             apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() == '1'
//                                                                                 ? '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price']) + double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['cost_delivery'])).toStringAsFixed(2)} ريال '
//                                                                                 : '${(double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])).toStringAsFixed(2)} ريال ',
//                                                                             textAlign:
//                                                                                 TextAlign.right,
//                                                                             style: getStyle(
//                                                                                 blackColor,
//                                                                                 FontWeight.w300,
//                                                                                 18),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.moneyBill,
//                                                                                 color: grayColor,
//                                                                                 size: 20,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               Text(
//                                                                                 'سعر الأطباق',
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           Text(
//                                                                             '${double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])} ريال ',
//                                                                             textAlign:
//                                                                                 TextAlign.right,
//                                                                             style: getStyle(
//                                                                                 blackColor,
//                                                                                 FontWeight.w300,
//                                                                                 18),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Icon(
//                                                                                 FontAwesomeIcons.mapMarkerAlt,
//                                                                                 color: grayColor,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: ScreenUtil().setWidth(10),
//                                                                               ),
//                                                                               apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].length > 10
//                                                                                   ? Text(
//                                                                                       '${apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].toString().substring(0, 17)}' ?? '',
//                                                                                       textAlign: TextAlign.right,
//                                                                                       overflow: TextOverflow.ellipsis,
//                                                                                       style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                     )
//                                                                                   : Text(
//                                                                                       apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] ?? '',
//                                                                                       textAlign: TextAlign.right,
//                                                                                       overflow: TextOverflow.ellipsis,
//                                                                                       style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                     ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(20)),
//                                                                       Padding(
//                                                                         padding:
//                                                                             const EdgeInsets.all(8.0),
//                                                                         child:
//                                                                             CustomButton(
//                                                                           title:
//                                                                               'أوافق',
//                                                                           onTap:
//                                                                               () {
//                                                                             FocusScope.of(context).unfocus();

//                                                                             Get.bottomSheet(SizedBox(
//                                                                               height: ScreenUtil().setHeight(406),
//                                                                               width: ScreenUtil().setWidth(375),
//                                                                               child: Container(
//                                                                                 padding: EdgeInsets.all(20),
//                                                                                 decoration: BoxDecoration(
//                                                                                   color: whiteColor,
//                                                                                   boxShadow: [
//                                                                                     BoxShadow(
//                                                                                       offset: Offset(0.00, 3.00),
//                                                                                       color: blackColor.withOpacity(0.16),
//                                                                                       blurRadius: 6,
//                                                                                     ),
//                                                                                   ],
//                                                                                   borderRadius: BorderRadius.only(
//                                                                                     topLeft: Radius.circular(20.00),
//                                                                                     topRight: Radius.circular(20.00),
//                                                                                   ),
//                                                                                 ),
//                                                                                 child: Column(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                   children: [
//                                                                                     Text(
//                                                                                       "الوقت المطلوب لتحضير الطلب ",
//                                                                                       textAlign: TextAlign.right,
//                                                                                       style: getStyle(blackColor, FontWeight.w700, 20),
//                                                                                     ),
//                                                                                     Column(
//                                                                                       crossAxisAlignment: CrossAxisAlignment.end,
//                                                                                       children: [
//                                                                                         Align(
//                                                                                           alignment: Alignment.centerRight,
//                                                                                           child: Text(
//                                                                                             "يحتاج تحضير الطلب ",
//                                                                                             textAlign: TextAlign.right,
//                                                                                             style: getStyle(blackColor, FontWeight.normal, 18),
//                                                                                           ),
//                                                                                         ),
//                                                                                         SizedBox(height: ScreenUtil().setHeight(15)),
//                                                                                         Container(
//                                                                                           height: ScreenUtil().setHeight(55),
//                                                                                           width: ScreenUtil().setWidth(170),
//                                                                                           decoration: BoxDecoration(
//                                                                                             border: Border.all(
//                                                                                               width: 0.50,
//                                                                                               color: blackOpacityColor,
//                                                                                             ),
//                                                                                             borderRadius: BorderRadius.circular(18),
//                                                                                           ),
//                                                                                           child: ClipRRect(
//                                                                                             borderRadius: BorderRadius.circular(18),
//                                                                                             child: Row(
//                                                                                               children: [
//                                                                                                 Container(
//                                                                                                   padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
//                                                                                                   child: Center(
//                                                                                                     child: Text(
//                                                                                                       "دقيقة",
//                                                                                                       textAlign: TextAlign.right,
//                                                                                                       style: getStyle(blackColor, FontWeight.w700, 18),
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 ),
//                                                                                                 VerticalDivider(
//                                                                                                   thickness: 1,
//                                                                                                 ),
//                                                                                                 Expanded(
//                                                                                                   child: TextFormField(
//                                                                                                     keyboardType: TextInputType.number,
//                                                                                                     onChanged: (value) {
//                                                                                                       timeOrderOsra = value;
//                                                                                                     },
//                                                                                                     decoration: InputDecoration(
//                                                                                                       contentPadding: const EdgeInsets.only(top: 10.0, bottom: 5, left: 10, right: 10),
//                                                                                                       fillColor: whiteColor,
//                                                                                                       filled: true,
//                                                                                                       border: InputBorder.none,
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ],
//                                                                                             ),
//                                                                                           ),
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                     CustomButton(
//                                                                                       title: 'التالي',
//                                                                                       onTap: () {
//                                                                                         FocusScope.of(context).unfocus();
//                                                                                         if (timeOrderOsra == null || timeOrderOsra == '') {
//                                                                                           getSheetError('الرجاء كتابة الوقت ');
//                                                                                         } else {
//                                                                                           Server.server.approvedorder(apiGet.osraOrderDeyailsMap['purchase'][0]['request_id'].toString(), '1', timeOrderOsra);
//                                                                                           controller.setCurentStep(2);
//                                                                                         }
//                                                                                       },
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ));
//                                                                           },
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(
//                                                                           height:
//                                                                               ScreenUtil().setHeight(5)),
//                                                                     ],
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           );
//                                                         })
//                                                       : controller.curStep == 2
//                                                           ? Obx(() {
//                                                               return apiGet
//                                                                       .osraOrderDeyailsMap
//                                                                       .isEmpty
//                                                                   ? loading()
//                                                                   : Expanded(
//                                                                       child:
//                                                                           Container(
//                                                                       margin: EdgeInsets.symmetric(
//                                                                           horizontal:
//                                                                               ScreenUtil().setWidth(10)),
//                                                                       child:
//                                                                           Column(
//                                                                         crossAxisAlignment:
//                                                                             CrossAxisAlignment.start,
//                                                                         children: [
//                                                                           Expanded(
//                                                                             child:
//                                                                                 ListView.builder(
//                                                                               itemCount: apiGet.osraOrderDeyailsMap['purchase'].length,
//                                                                               itemBuilder: (BuildContext context, int index) {
//                                                                                 List extraList = apiGet.osraOrderDeyailsMap['purchase'][index]['extra'];
//                                                                                 return ExpansionTile(
//                                                                                   childrenPadding: EdgeInsets.all(0),
//                                                                                   leading: Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][index]['subproductname'],
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w700, 18),
//                                                                                   ),
//                                                                                   title: Container(
//                                                                                     height: ScreenUtil().setHeight(25),
//                                                                                     decoration: BoxDecoration(
//                                                                                       color: whiteColor,
//                                                                                       shape: BoxShape.circle,
//                                                                                     ),
//                                                                                     child: Center(
//                                                                                       child: Text(
//                                                                                         'عدد ${apiGet.osraOrderDeyailsMap['purchase'][index]['quantity']}',
//                                                                                         textAlign: TextAlign.right,
//                                                                                         style: getStyle(blackColor, FontWeight.normal, 18),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                   children: extraList.length ==
//                                                                                           0
//                                                                                       ? [
//                                                                                           Text('لا يوجد إضافات')
//                                                                                         ]
//                                                                                       : extraList.map((e) {
//                                                                                           return ListTile(
//                                                                                             leading: Text(
//                                                                                               e['name'],
//                                                                                               textAlign: TextAlign.right,
//                                                                                               style: getStyle(blackColor, FontWeight.w700, 16),
//                                                                                             ),
//                                                                                           );
//                                                                                         }).toList(),
//                                                                                 );
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     Icons.person,
//                                                                                     color: grayColor,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['jawwal'].toString(),
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: ScreenUtil().setHeight(20)),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.mapMarkerAlt,
//                                                                                     color: grayColor,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].length > 10
//                                                                                       ? Text(
//                                                                                           '${apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].toString().substring(0, 17)}' ?? '',
//                                                                                           textAlign: TextAlign.right,
//                                                                                           overflow: TextOverflow.ellipsis,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                         )
//                                                                                       : Text(
//                                                                                           apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'],
//                                                                                           textAlign: TextAlign.right,
//                                                                                           overflow: TextOverflow.ellipsis,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                         ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20),
//                                                                           ),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.moneyBill,
//                                                                                     color: grayColor,
//                                                                                     size: 20,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() != '1' ? "استلام شخصي" : "توصيل مندوب",
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: ScreenUtil().setHeight(20)),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.moneyBill,
//                                                                                     color: grayColor,
//                                                                                     size: 20,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     apiGet.osraOrderDeyailsMap['purchase'][0]['is_cash'].toString() != '1' ? "الدفع أونلاين" : "الدفع عند الاستلام",
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                               Text(
//                                                                                 '${double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total'])} ريال ',
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: ScreenUtil().setHeight(20)),
//                                                                           Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Row(
//                                                                                 children: [
//                                                                                   Icon(
//                                                                                     FontAwesomeIcons.moneyBill,
//                                                                                     color: grayColor,
//                                                                                     size: 20,
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     'سعر الأطباق',
//                                                                                     textAlign: TextAlign.right,
//                                                                                     style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     width: ScreenUtil().setWidth(10),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                               Text(
//                                                                                 '${double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total_price'])} ريال ',
//                                                                                 textAlign: TextAlign.right,
//                                                                                 style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 ScreenUtil().setHeight(20),
//                                                                           ),
//                                                                           Padding(
//                                                                             padding:
//                                                                                 EdgeInsets.all(8.0),
//                                                                             child:
//                                                                                 CustomButton(
//                                                                               title: 'تم التحضير',
//                                                                               onTap: () {
//                                                                                 FocusScope.of(context).unfocus();

//                                                                                 Server.server.changeorder(apiGet.osraOrderDeyailsMap['purchase'][0]['request_id'].toString(), '3');
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: ScreenUtil().setHeight(20)),
//                                                                         ],
//                                                                       ),
//                                                                     ));
//                                                             })
//                                                           : Obx(() {
//                                                               return apiGet
//                                                                       .osraOrderDeyailsMap
//                                                                       .isEmpty
//                                                                   ? loading()
//                                                                   : Expanded(
//                                                                       child:
//                                                                           Container(
//                                                                         margin: EdgeInsets.symmetric(
//                                                                             horizontal:
//                                                                                 ScreenUtil().setWidth(10)),
//                                                                         child:
//                                                                             ListView(
//                                                                           children: [
//                                                                             Column(
//                                                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                                                               children: [
//                                                                                 Row(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                   children: [
//                                                                                     Row(
//                                                                                       children: [
//                                                                                         Icon(
//                                                                                           Icons.person,
//                                                                                           color: grayColor,
//                                                                                         ),
//                                                                                         SizedBox(
//                                                                                           width: ScreenUtil().setWidth(10),
//                                                                                         ),
//                                                                                         Text(
//                                                                                           apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['jawwal'].toString(),
//                                                                                           textAlign: TextAlign.right,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                                 SizedBox(height: ScreenUtil().setHeight(20)),
//                                                                                 Row(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                   children: [
//                                                                                     Row(
//                                                                                       children: [
//                                                                                         Icon(
//                                                                                           FontAwesomeIcons.mapMarkerAlt,
//                                                                                           color: grayColor,
//                                                                                         ),
//                                                                                         SizedBox(
//                                                                                           width: ScreenUtil().setWidth(10),
//                                                                                         ),
//                                                                                         apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].length > 10
//                                                                                             ? Text(
//                                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : '${apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'].toString().substring(0, 17)}',
//                                                                                                 textAlign: TextAlign.right,
//                                                                                                 overflow: TextOverflow.ellipsis,
//                                                                                                 style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                               )
//                                                                                             : Text(
//                                                                                                 apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'] == null ? 'لا يوجد عنوان ' : apiGet.osraOrderDeyailsMap['purchase'][0]['userapp'][0]['address_user'],
//                                                                                                 textAlign: TextAlign.right,
//                                                                                                 overflow: TextOverflow.ellipsis,
//                                                                                                 style: getStyle(blackColor, FontWeight.w300, 16),
//                                                                                               ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   height: ScreenUtil().setHeight(20),
//                                                                                 ),
//                                                                                 Row(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                   children: [
//                                                                                     Row(
//                                                                                       children: [
//                                                                                         Icon(
//                                                                                           FontAwesomeIcons.moneyBill,
//                                                                                           color: grayColor,
//                                                                                           size: 20,
//                                                                                         ),
//                                                                                         SizedBox(
//                                                                                           width: ScreenUtil().setWidth(10),
//                                                                                         ),
//                                                                                         Text(
//                                                                                           apiGet.osraOrderDeyailsMap['purchase'][0]['delivery_type'].toString() != '1' ? "استلام شخصي" : "توصيل مندوب",
//                                                                                           textAlign: TextAlign.right,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                         ),
//                                                                                         SizedBox(
//                                                                                           width: ScreenUtil().setWidth(10),
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                                 SizedBox(height: ScreenUtil().setHeight(20)),
//                                                                                 Row(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                   children: [
//                                                                                     Row(
//                                                                                       children: [
//                                                                                         Icon(
//                                                                                           FontAwesomeIcons.moneyBill,
//                                                                                           color: grayColor,
//                                                                                           size: 20,
//                                                                                         ),
//                                                                                         SizedBox(
//                                                                                           width: ScreenUtil().setWidth(10),
//                                                                                         ),
//                                                                                         Text(
//                                                                                           apiGet.osraOrderDeyailsMap['purchase'][0]['is_cash'].toString() != '1' ? "الدفع أونلاين" : "الدفع عند الاستلام",
//                                                                                           textAlign: TextAlign.right,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                         ),
//                                                                                         SizedBox(
//                                                                                           width: ScreenUtil().setWidth(10),
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                     Text(
//                                                                                       '${double.parse(apiGet.osraOrderDeyailsMap['purchase'][0]['total'])} ريال ',
//                                                                                       textAlign: TextAlign.right,
//                                                                                       style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   height: ScreenUtil().setHeight(20),
//                                                                                 ),
//                                                                                 // Row(
//                                                                                 //   mainAxisAlignment:
//                                                                                 //       MainAxisAlignment
//                                                                                 //           .spaceBetween,
//                                                                                 //   children: [
//                                                                                 //     Row(
//                                                                                 //       children: [
//                                                                                 //         Icon(
//                                                                                 //           FontAwesomeIcons.hourglass,
//                                                                                 //           color:
//                                                                                 //               grayColor,
//                                                                                 //           size:
//                                                                                 //               24,
//                                                                                 //         ),
//                                                                                 //         SizedBox(
//                                                                                 //           width:
//                                                                                 //               ScreenUtil().setWidth(10),
//                                                                                 //         ),
//                                                                                 //         Text(
//                                                                                 //           "وقت الطلب",
//                                                                                 //           textAlign:
//                                                                                 //               TextAlign.right,
//                                                                                 //           style: getStyle(
//                                                                                 //               blackColor,
//                                                                                 //               FontWeight.w300,
//                                                                                 //               18),
//                                                                                 //         ),
//                                                                                 //       ],
//                                                                                 //     ),
//                                                                                 //     Text(
//                                                                                 //       "م 3:30",
//                                                                                 //       textAlign:
//                                                                                 //           TextAlign.right,
//                                                                                 //       style: getStyle(
//                                                                                 //           blackColor,
//                                                                                 //           FontWeight.w300,
//                                                                                 //           18),
//                                                                                 //     ),
//                                                                                 //   ],
//                                                                                 // ),
//                                                                                 // SizedBox(
//                                                                                 //   height: ScreenUtil()
//                                                                                 //       .setHeight(
//                                                                                 //           20),
//                                                                                 // ),
//                                                                                 Row(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                   children: [
//                                                                                     Row(
//                                                                                       children: [
//                                                                                         Icon(
//                                                                                           FontAwesomeIcons.hourglass,
//                                                                                           color: grayColor,
//                                                                                           size: 24,
//                                                                                         ),
//                                                                                         SizedBox(
//                                                                                           width: ScreenUtil().setWidth(10),
//                                                                                         ),
//                                                                                         Text(
//                                                                                           "وقت التسليم",
//                                                                                           textAlign: TextAlign.right,
//                                                                                           style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                     Text(
//                                                                                       apiGet.osraOrderDeyailsMap.isEmpty ? '' : apiGet.osraOrderDeyailsMap['purchase'][0]['end_request'].toString().split(' ')[1],
//                                                                                       textAlign: TextAlign.right,
//                                                                                       style: getStyle(blackColor, FontWeight.w300, 18),
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                                 SizedBox(
//                                                                                   height: ScreenUtil().setHeight(50),
//                                                                                 ),
//                                                                                 controller.curStep == 4
//                                                                                     ? Container()
//                                                                                     : CustomButton(
//                                                                                         title: 'تم تسليم للعميل',
//                                                                                         onTap: () {
//                                                                                           FocusScope.of(context).unfocus();

//                                                                                           Server.server.changeorder(apiGet.osraOrderDeyailsMap['purchase'][0]['request_id'].toString(), '6');
//                                                                                           controller.setCurentStep(5);
//                                                                                           controller.setShowDetailsOrders(false);
//                                                                                         },
//                                                                                       ),
//                                                                                 SizedBox(
//                                                                                   height: ScreenUtil().setHeight(20),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     );
//                                                             }),
//                                                 ],
//                                               ),
//                               );
//                             }),
//                 ),
//               ],
//             );
//           });
//         }),
//   );
// }
