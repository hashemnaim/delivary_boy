// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:delivery_boy/backend/auth_get.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/components/widgets/custom_text_field.dart';
// import 'package:delivery_boy/components/widgets/custom_text_filed_mobile.dart';
// import 'package:delivery_boy/features/families/screens/send_code_screen.dart';
// import 'package:delivery_boy/features/families/screens/sign_up_familes_screen.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class SignInFamilyScreen extends StatelessWidget {
//   AuthGet authGet = Get.find();
//   String mobile;
//   String password;

//   setMobile(String mobile) {
//     this.mobile = mobile;
//   }

//   setPassword(String password) {
//     this.password = password;
//   }

//   validationPassword(String value) {
//     if (GetUtils.isNull(value) || value.isEmpty) {
//       return 'هذا الحقل مطلوب *';
//     }
//   }

//   validationMobile(String value) {
//     if (GetUtils.isNull(value) || value.isEmpty) {
//       return 'هذا الحقل مطلوب *';
//     } else if (!GetUtils.isNum(value)) {
//       return 'رقم الهاتف يحتوي علي أرقام فقط';
//     }
//     // else
//     // if (value.length != 10) {
//     //   return translator.translate('error_mobile_length');
//     // }
//   }

//   GlobalKey<FormState> signInKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 250.h,
//             child: Image.asset(
//               home2jpg,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Container(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Text(
//                     "أهلا وسهلا بك",
//                     textAlign: TextAlign.right,
//                     style: getStyle(
//                       blackColor,
//                       FontWeight.w700,
//                       20.sp,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Expanded(
//                     child: Container(
//                       margin: EdgeInsets.symmetric(
//                         horizontal: ScreenUtil().setWidth(20),
//                       ),
//                       child: Form(
//                         key: signInKey,
//                         child: ListView(
//                           children: [
//                             Text(
//                               "رقم الجوال ",
//                               textAlign: TextAlign.right,
//                               style: getStyle(
//                                 blackColor,
//                                 FontWeight.normal,
//                                 18.sp,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 17.h,
//                             ),
//                             CustomTextFieldMobile(
//                               onsaved: setMobile,
//                               validation: validationMobile,
//                             ),
//                             SizedBox(
//                               height: 12.h,
//                             ),
//                             Text(
//                               "كلمة المرور ",
//                               textAlign: TextAlign.right,
//                               style: getStyle(
//                                 blackColor,
//                                 FontWeight.normal,
//                                 18,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 17.h,
//                             ),
//                             CustomTextFiled(
//                               onSaved: (value) => setPassword(value),
//                               onValidate: (value) => validationPassword(value),
//                               isPassword: true,
//                               keyboardType: TextInputType.text,
//                             ),
//                             SizedBox(
//                               height: 93.h,
//                             ),
//                             CustomButton(
//                               title: 'دخول ',
//                               onTap: () async {
//                                 FocusScope.of(context).unfocus();
//                                 if (signInKey.currentState.validate()) {
//                                   signInKey.currentState.save();
//                                   await Server.server.login(
//                                     mobile,
//                                     password,
//                                     authGet.lat.toString(),
//                                     authGet.long.toString(),
//                                   );
                                
//                                 }
//                               },
//                             ),
//                             SizedBox(
//                               height: 18.h,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Get.to(SendCodeScreen(0));
//                               },
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "نسيت كلمة المرور؟",
//                                   textAlign: TextAlign.right,
//                                   style: getStyle(
//                                     blackColor,
//                                     FontWeight.normal,
//                                     16.sp,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 39.h,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Get.to(SignUpFamilyScreen());
//                               },
//                               child: Align(
//                                 alignment: Alignment.center,
//                                 child: Text.rich(
//                                   TextSpan(
//                                     text: 'ليس لدي حساب؟  ',
//                                     style: getStyle(
//                                         blackColor, FontWeight.w300, 16.sp),
//                                     children: [
//                                       TextSpan(
//                                         text: ' تسجيل حساب',
//                                         style: GoogleFonts.montserrat(
//                                           textStyle: TextStyle(
//                                             fontSize: 16.sp,
//                                             color: orangeColor,
//                                             decoration:
//                                                 TextDecoration.underline,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 15.h,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
