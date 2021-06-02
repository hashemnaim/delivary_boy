// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class CheckSendCodeScreen extends StatefulWidget {
//   final int type;
//   final String mobile;
//   final String password;
//   final bool isFirst;
//   CheckSendCodeScreen(this.type, this.mobile, this.isFirst, this.password);
//   @override
//   _CheckSendCodeScreenState createState() => _CheckSendCodeScreenState();
// }

// class _CheckSendCodeScreenState extends State<CheckSendCodeScreen> {
//   TextEditingController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250.h,
//                 child: Image.asset(
//                   widget.type == 0 ? home1jpg : backDeliverytopSvg,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.symmetric(
//                     horizontal: 20.h,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Text(
//                         widget.isFirst ? "تأكيد الحساب" : "نسيت كلمة المرور ",
//                         style: getStyle(
//                           blackColor,
//                           FontWeight.w700,
//                           20.sp,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Expanded(
//                           child: ListView(
//                         children: [
//                           Container(
//                             width: 150.w,
//                             height: 50.h,
//                             child: Text(
//                               '''الرجاء ادخال الرمز الذي 
// تلقيته علي جوالك''',
//                               textAlign: TextAlign.center,
//                               style: getStyle(
//                                 blackColor,
//                                 FontWeight.normal,
//                                 16.sp,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 29.h,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 40.w,
//                             ),
//                             child: PinCodeTextField(
//                               length: 6,
//                               appContext: context,
//                               controller: controller,
//                               backgroundColor: Colors.transparent,
//                               onChanged: (text) {},
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 23.h,
//                           ),
//                           Text("لم تتلق رمز؟",
//                               textAlign: TextAlign.center,
//                               style:
//                                   getStyle(blackColor, FontWeight.w300, 16.sp)),
//                           SizedBox(
//                             height: 13.h,
//                           ),
//                           GestureDetector(
//                             onTap: () {
                              
//                               Server.server.resetpassword2(widget.mobile);
//                             },
//                             child: Text(
//                               "إعاده ارسال",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.almarai(
//                                 textStyle: TextStyle(
//                                   fontSize: 16.sp,
//                                   color: orangeColor,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: ScreenUtil().setHeight(90),
//                           ),
//                           CustomButton(
//                             title: 'ارسال ',
//                             onTap: () async {
//                               FocusScope.of(context).unfocus();
//                               if (controller.text == '') {
//                                 getSheetSucsses('الرجاء إدخال الكود المرسل');
//                               } else {
//                                 if (widget.isFirst) {
//                                   int i = await Server.server.verifycode2(
//                                     widget.mobile,
//                                     controller.text,
//                                     widget.password,
//                                     widget.type,
//                                   );
//                                   if (i == 1) {
//                                     Timer(Duration(seconds: 3), () {
//                                       Get.back();
//                                     });
//                                     return Get.dialog(
//                                       Dialog(
//                                         backgroundColor: Colors.transparent,
//                                         insetPadding: EdgeInsets.all(0),
//                                         child: ClipRRect(
//                                           child: Container(
//                                             height: ScreenUtil().setHeight(187),
//                                             width: ScreenUtil().setWidth(335),
//                                             decoration: BoxDecoration(
//                                               color: whiteColor,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   offset: Offset(0.00, 3.00),
//                                                   color: blackColor
//                                                       .withOpacity(0.16),
//                                                   blurRadius: 6,
//                                                 ),
//                                               ],
//                                               borderRadius:
//                                                   getBoarderRadius(41.00),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 ''' تم إرسال طلبك لإدارة التطبيق 
//    انتظر الموافقة علي طلبك''',
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                   fontFamily: "Almarai",
//                                                   fontSize: 18,
//                                                   height: 1.5,
//                                                   color: Color(0xff000000),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   } else {}
//                                 } else {
//                                   Server.server.verifycode(
//                                     widget.mobile,
//                                     controller.text,
//                                     widget.type,
//                                   );
//                                 }
//                               }
//                             },
//                           ),
//                         ],
//                       ))
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Directionality(
//             textDirection: TextDirection.rtl,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: SizedBox(
//                 height: ScreenUtil().setHeight(100),
//                 child: AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   automaticallyImplyLeading: true,
//                   // iconTheme: IconThemeData(color: orangeColor),
//                   // actions: [
//                   //   Icon(Icons.arrow_forward),
//                   // ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
