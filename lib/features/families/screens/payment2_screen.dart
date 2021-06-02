// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/components/widgets/custom_drop_down.dart';
// import 'package:delivery_boy/components/widgets/custom_text_field.dart';
// import 'package:delivery_boy/features/families/screens/home_screen.dart';
// import 'package:delivery_boy/features/families/widgets/dialog_family.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class Payment2Screen extends StatefulWidget {
//   @override
//   _Payment2ScreenState createState() => _Payment2ScreenState();
// }

// class _Payment2ScreenState extends State<Payment2Screen> {
//   bool isExpanded = false;
//   String bankName;

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
//                     top2Svg,
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(
//               horizontal: 20.h,
//             ),
//             child: ListView(
//               children: [
//                 SizedBox(height: 160.h),
//                 Text(
//                   "معلومات الدفع",
//                   textAlign: TextAlign.right,
//                   style: getStyle(blackColor, FontWeight.w700, 20.sp),
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 Text(
//                   "الاسم",
//                   textAlign: TextAlign.right,
//                   style: getStyle(blackColor, FontWeight.normal, 18.sp),
//                 ),
//                 SizedBox(
//                   height: 17.h,
//                 ),
//                 CustomTextFiled(),
//                 SizedBox(
//                   height: 13.h,
//                 ),
//                 Text(
//                   "رقم الحساب ",
//                   textAlign: TextAlign.right,
//                   style: getStyle(blackColor, FontWeight.normal, 18.sp),
//                 ),
//                 SizedBox(
//                   height: 17.h,
//                 ),
//                 CustomTextFiled(),
//                 SizedBox(
//                   height: 13.h,
//                 ),
//                 Text(
//                   "اسم البنك",
//                   textAlign: TextAlign.right,
//                   style: getStyle(blackColor, FontWeight.normal, 18),
//                 ),
//                 SizedBox(
//                   height: 17.h,
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       isExpanded = !isExpanded;
//                       setState(() {});
//                     },
//                     child: CustomDropDownButton(
//                       isCheck: isExpanded,
//                       title: bankName ?? 'اختيار اسم البنك',
//                     )),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 !isExpanded
//                     ? Container()
//                     : Container(
//                         height: ScreenUtil().setHeight(230),
//                         width: ScreenUtil().setWidth(335),
//                         decoration: BoxDecoration(
//                           color: whiteColor,
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(0.00, 3.00),
//                               color: blackColor.withOpacity(0.16),
//                               blurRadius: 6,
//                             ),
//                           ],
//                           borderRadius: getBoarderRadius(18.00),
//                         ),
//                         child: ListView.builder(
//                             // physics: NeverScrollableScrollPhysics(),
//                             itemCount: 100,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   isExpanded = false;
//                                   bankName = 'البنك الاسلامي';
//                                   setState(() {});
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.all(10),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         'البنك الإسلامي',
//                                         textAlign: TextAlign.right,
//                                         style: getStyle(
//                                           Color(0xff707070),
//                                           FontWeight.w300,
//                                           18,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }),
//                       ),
//                 SizedBox(
//                   height: 120.h,
//                 ),
//                 CustomButton(
//                   title: 'تأكيد ',
//                   onTap: () {
//                     FocusScope.of(context).unfocus();

//                     Get.dialog(DialogAccept(
//                       title:
//                           '''هل توافق علي حضور العملاء الي موقعك \nلاخد طلباتهم دون الحاجة الي
//  مندوبين توصيل؟ ''',
//                       titleBtn1: 'نعم أوافق',
//                       titleBtn2: 'لا أوافق',
//                       onTap1: () {
//                         Get.offAll(HomeFamilyScreen());
//                       },
//                       onTap2: () {
//                         Get.back();
//                       },
//                     ));
//                   },
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
