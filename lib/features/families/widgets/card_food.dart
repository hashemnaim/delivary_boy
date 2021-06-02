// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';

// class CardFood extends StatelessWidget {
//   final Map map;

//   const CardFood({this.map});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: orange2Color,
//       padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
//       width: Get.width,
//       height: ScreenUtil().setHeight(70),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               CachedNetworkImageShare(map['image'], 55, 78, 3),
//               SizedBox(
//                 width: ScreenUtil().setWidth(15),
//               ),
//               Text(
//                 "${map['price']} ريال ",
//                 textAlign: TextAlign.right,
//                 style: getStyle(orange2Color, FontWeight.w700, 16),
//               ),
//             ],
//           ),
//           Text(
//             map['sub_product_name'] == null
//                 ? map['name']
//                 : map['sub_product_name'],
//             textAlign: TextAlign.right,
//             style: getStyle(blackColor, FontWeight.normal, 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
