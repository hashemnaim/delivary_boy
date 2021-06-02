// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/components/widgets/custom_drop_down.dart';
// import 'package:delivery_boy/features/families/screens/payment2_screen.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class Payment1Screen extends StatefulWidget {
//   @override
//   _Payment1ScreenState createState() => _Payment1ScreenState();
// }

// class _Payment1ScreenState extends State<Payment1Screen> {
//   bool isCard = false;

//   bool isPalPay = false;

//   bool isMada = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       body: Stack(
//         children: [
//           Transform.translate(
//             offset: Offset(-90.w, -55.h),
//             child: Container(
//               width: 307.w,
//               height: 307.h,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: AssetImage(
//                     egesSvg,
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(
//               horizontal: 20.w,
//             ),
//             child: ListView(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     SizedBox(height: 170.h),
//                     Text(
//                       "الدفع الالكتروني",
//                       textAlign: TextAlign.right,
//                       style: getStyle(blackColor, FontWeight.w700, 20.sp),
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         this.isCard = !isCard;
//                         this.isPalPay = false;
//                         this.isMada = false;
//                         setState(() {});
//                       },
//                       child: CustomDropDownButton(
//                         isCheck: isCard,
//                         title: 'بطاقة ائتمانية',
//                         isChoose: true,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         this.isCard = false;
//                         this.isPalPay = !isPalPay;
//                         this.isMada = false;
//                         setState(() {});
//                       },
//                       child: CustomDropDownButton(
//                         isCheck: isPalPay,
//                         title: 'ابل باي ',
//                         isChoose: true,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         this.isCard = false;
//                         this.isPalPay = false;
//                         this.isMada = !isMada;
//                         setState(() {});
//                       },
//                       child: CustomDropDownButton(
//                         isCheck: isMada,
//                         title: 'مدي',
//                         isChoose: true,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200.h,
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: CustomButton(
//                         title: 'التالي ',
//                         onTap: () {
//                           FocusScope.of(context).unfocus();

//                           Get.to(Payment2Screen());
//                         },
//                       ),
//                     ),
//                   ],
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
