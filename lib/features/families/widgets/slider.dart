// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';

// class SliderScreen extends StatefulWidget {
//   final List offersList;

//   const SliderScreen({this.offersList});
//   @override
//   _SliderScreenState createState() => _SliderScreenState();
// }

// class _SliderScreenState extends State<SliderScreen> {
//   int current = 0;

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> offersNameSliders = widget.offersList
//         .map(
//           (item) => Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: ScreenUtil().setWidth(15)),
//                   child: Text(
//                     item['name'].toString(),
//                     textAlign: TextAlign.right,
//                     style: getStyle(blackColor, FontWeight.w300, 18),
//                   ),
//                 ),
//                 SizedBox(
//                   height: ScreenUtil().setHeight(10),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: GestureDetector(
//                     onTap: () async {
//                       //  item['is_active'] =="0"
//                       Server.server.initPayment(
//                         item['id'].toString(),
//                         // item['price'],
//                         '1',
//                         false,
//                       );
//                     },
//                     child: Container(
//                       height: ScreenUtil().setHeight(41),
//                       width: ScreenUtil().setWidth(96),
//                       decoration: BoxDecoration(
//                         color: orangeColor,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0.00, 3.00),
//                             color: blackColor.withOpacity(0.16),
//                             blurRadius: 6,
//                           ),
//                         ],
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(10.00),
//                           bottomLeft: Radius.circular(10.00),
//                         ),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "اشتراك",
//                           textAlign: TextAlign.right,
//                           style: getStyle(whiteColor, FontWeight.w700, 18),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//         .toList();
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             // color: redColor,
//             width: ScreenUtil().setWidth(350),
//             height: ScreenUtil().setHeight(110),
//             padding: EdgeInsets.only(bottom: 2, top: 2),
//             decoration: BoxDecoration(
//               color: whiteColor,
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0.00, 3.00),
//                   color: blackColor.withOpacity(0.16),
//                   blurRadius: 6,
//                 ),
//               ],
//               borderRadius: getBoarderRadius(10.00),
//             ),
//             child: Carousel(
//               autoplay: false,
//               images: offersNameSliders,
//               showIndicator: false,
//               onImageChange: (index, number2) {
//                 current = index;
//                 setState(() {});
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 30, right: 30, bottom: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: widget.offersList.map((url) {
//                 int index = widget.offersList.indexOf(url);
//                 return current == index
//                     ? Container(
//                         width: 24.0.w,
//                         height: 10.0.h,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: orangeColor,
//                         ),
//                       )
//                     : Container(
//                         width: 10.0.w,
//                         height: 10.0.h,
//                         margin: EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 2.0),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xffcccccc),
//                         ),
//                       );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
