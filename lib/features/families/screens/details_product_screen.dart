// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/backend/api_get.dart';
// import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
// import 'package:delivery_boy/components/widgets/custom_divider.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final Map map;

//   ProductDetailsScreen(this.map);
//   @override
//   _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   ApiGet apiGet = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//             preferredSize: Size(double.infinity, 50.h),
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: AppBar(
//                 centerTitle: true,
//                 elevation: 0,
//                 title: Text(
//                   'تفاصيل الطبق',
//                   textAlign: TextAlign.right,
//                   style: getStyle(whiteColor, FontWeight.w700, 20.sp),
//                 ),
//                 backgroundColor: orangeColor,
//                 actionsIconTheme: IconThemeData(color: whiteColor),
//               ),
//             )),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 margin: EdgeInsets.only(top: 34.h, left: 19.w, right: 19.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(widget.map['products_name']??'',
//                                 textAlign: TextAlign.right,
//                                 style: getStyle(
//                                     blackColor, FontWeight.normal, 16.sp)),
//                             SizedBox(
//                               height: 15.h,
//                             ),
//                             Text(
//                                 widget.map['sub_product_name'] == null
//                                     ? widget.map['name']
//                                     : widget.map['sub_product_name'],
//                                 textAlign: TextAlign.right,
//                                 style: getStyle(
//                                     blackColor, FontWeight.normal, 16.sp)),
//                             SizedBox(
//                               height: 15.h,
//                             ),
//                             Text(
//                               "${widget.map['price']} ريال ",
//                               textAlign: TextAlign.right,
//                               style:
//                                   getStyle(orange2Color, FontWeight.w700, 16),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 27.w,
//                         ),
//                         CachedNetworkImageShare(
//                             widget.map['image'], 98, 141, 3),
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     widget.map['drink'] == null
//                         ? Container()
//                         : Text(
//                             'مشروب مجاني ',
//                             textAlign: TextAlign.right,
//                             style: getStyle(blackColor, FontWeight.w700, 16.sp),
//                           ),
//                     widget.map['drink'] == null
//                         ? Container()
//                         : Text(
//                             "${widget.map['drink']} ",
//                             textAlign: TextAlign.right,
//                             style:
//                                 getStyle(orange2Color, FontWeight.w300, 17.sp),
//                           ),
//                     SizedBox(height: 20.h),
//                     widget.map['extra'].length == 0
//                         ? Container()
//                         : Text(
//                             "إضافات الي الطبق ",
//                             textAlign: TextAlign.right,
//                             style: getStyle(blackColor, FontWeight.w700, 18.sp),
//                           ),
//                     SizedBox(height: 20.h),
//                     Expanded(
//                       child: SizedBox(
//                         height: (widget.map['extra'].length * 70).toDouble(),
//                         child: ListView.separated(
//                           separatorBuilder: (context, index) {
//                             return CustomDivider();
//                           },
//                           itemCount: widget.map['extra'].length,
//                           itemBuilder: (BuildContext context, int index) {
//                             Map map = widget.map['extra'][index];
//                             return Padding(
//                               padding: EdgeInsets.only(bottom: 10.h, top: 10),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     ' ${map['price']} ريال ',
//                                     textAlign: TextAlign.right,
//                                     style: getStyle(
//                                         blackColor, FontWeight.w300, 16.sp),
//                                   ),
//                                   Text(
//                                     map['name'],
//                                     textAlign: TextAlign.right,
//                                     style: getStyle(
//                                         orange2Color, FontWeight.w300, 16.sp),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
