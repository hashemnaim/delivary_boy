// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:delivery_boy/backend/auth_get.dart';
// import 'package:delivery_boy/backend/server.dart';
// import 'package:delivery_boy/components/widgets/custom_button.dart';
// import 'package:delivery_boy/components/widgets/custom_drop_down.dart';
// import 'package:delivery_boy/components/widgets/custom_select_photo.dart';
// import 'package:delivery_boy/components/widgets/custom_text_field.dart';
// import 'package:delivery_boy/components/widgets/custom_text_filed_mobile.dart';
// import 'package:delivery_boy/features/families/screens/sign_in_famlies_screen.dart';
// import 'package:delivery_boy/features/families/widgets/dialog_family.dart';
// import 'package:delivery_boy/values/color.dart';
// import 'package:delivery_boy/values/common.dart';
// import 'package:delivery_boy/values/constant.dart';

// class SignUpFamilyScreen extends StatelessWidget {
//   AuthGet authGet = Get.find();

//   String nameFamily;
//   String mobile;
//   String password;
//   String confirmPassword;
//   String numberAccountBank;

//   setConfirmPassword(String confirmPassword) {
//     this.confirmPassword = confirmPassword;
//   }

//   validateConfirmPassword(String value) {
//     if (GetUtils.isNull(value) || value.isEmpty) {
//       return 'هذا الحقل مطلوب *';
//     }
//     // else if (value.length < 8) {
//     //   return 'password_error'.tr;
//     // }
//     else if (this.confirmPassword != this.password) {
//       return 'كلمتا المرور غير متطابقتين';
//     }
//   }

//   setNumberAccountBank(String numberAccountBank) {
//     this.numberAccountBank = numberAccountBank;
//   }

//   setUserName(String nameFamily) {
//     this.nameFamily = nameFamily;
//   }

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
//     // else if (value.length != 10) {
//     //   return 'error_mobile_length'.tr;
//     // }
//   }

//   validationFamilyName(String value) {
//     if (GetUtils.isNull(value) || value.isEmpty) {
//       return 'هذا الحقل مطلوب *';
//     }
//   }

//   GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: 375.w,
//                 height: 250.h,
//                 child: Image.asset(
//                   home1jpg,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Expanded(
//                 child: DefaultTabController(
//                   length: 1,
//                   child: Container(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 30.h,
//                         ),
//                         Text(
//                           "تسجيل حساب ",
//                           textAlign: TextAlign.right,
//                           style: getStyle(
//                             blackColor,
//                             FontWeight.w700,
//                             20.sp,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 25.h,
//                         ),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: SizedBox(
//                             height: 60.h,
//                             width: 187.w,
//                             child: TabBar(
//                               unselectedLabelColor: blackColor,
//                               labelColor: orangeColor,
//                               indicatorWeight: 2,
//                               tabs: [
//                                 Tab(
//                                   child: Text(
//                                     "أسرة منتجة ",
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
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: TabBarView(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 20.w),
//                                 child: Form(
//                                   key: signUpKey,
//                                   child: ListView(
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end,
//                                         children: [
//                                           Text(
//                                             "رقم الجوال ",
//                                             textAlign: TextAlign.right,
//                                             style: getStyle(
//                                               blackColor,
//                                               FontWeight.normal,
//                                               18.sp,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 17.h,
//                                           ),
//                                           CustomTextFieldMobile(
//                                             onsaved: setMobile,
//                                             validation: validationMobile,
//                                           ),
//                                           SizedBox(
//                                             height: 12.h,
//                                           ),
//                                           Text(
//                                             "اسم الاسرة",
//                                             textAlign: TextAlign.right,
//                                             style: getStyle(
//                                               blackColor,
//                                               FontWeight.normal,
//                                               18,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 17.h,
//                                           ),
//                                           CustomTextFiled(
//                                             onSaved: (value) =>
//                                                 setUserName(value),
//                                             onValidate: (value) =>
//                                                 validationFamilyName(value),
//                                             keyboardType: TextInputType.text,
//                                           ),
//                                           SizedBox(
//                                             height: 12.h,
//                                           ),
//                                           Text(
//                                             "الصورة/الشعار",
//                                             textAlign: TextAlign.right,
//                                             style: getStyle(
//                                               blackColor,
//                                               FontWeight.normal,
//                                               18,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 17.h,
//                                           ),
//                                           Container(
//                                             height: 70.h,
//                                             child: Directionality(
//                                               textDirection: TextDirection.rtl,
//                                               child: GetBuilder<AuthGet>(
//                                                   init: AuthGet(),
//                                                   id: 'photo',
//                                                   builder: (authController) {
//                                                     return CustomSelectPhoto(
//                                                       image:
//                                                           authController.image,
//                                                       onTap: authController
//                                                           .addImage,
//                                                     );
//                                                   }),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 12.h,
//                                           ),
//                                           Text(
//                                             "اسم البنك ",
//                                             textAlign: TextAlign.right,
//                                             style: getStyle(
//                                               blackColor,
//                                               FontWeight.normal,
//                                               18,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: ScreenUtil().setHeight(12),
//                                           ),
//                                           GetBuilder<AuthGet>(
//                                             id: 'mapBanksName',
//                                             init: AuthGet(),
//                                             builder: (authController) {
//                                               return Column(
//                                                 children: [
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       authController
//                                                           .setIsExpandedBanck();
//                                                     },
//                                                     child: CustomDropDownButton(
//                                                       title: authController
//                                                                   .mapBanksNameSelected ==
//                                                               null
//                                                           ? 'اسم البنك'
//                                                           : authController
//                                                                   .mapBanksNameSelected[
//                                                               'name'],
//                                                       isCheck: authController
//                                                           .isExpandedBanck,
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     height: 8.h,
//                                                   ),
//                                                   !authController
//                                                           .isExpandedBanck
//                                                       ? Container()
//                                                       : Container(
//                                                           height: ScreenUtil()
//                                                               .setHeight(authController
//                                                                       .mapBanksName[
//                                                                           'bank']
//                                                                       .length *
//                                                                   50),
//                                                           width: ScreenUtil()
//                                                               .setWidth(335),
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             color: whiteColor,
//                                                             boxShadow: [
//                                                               BoxShadow(
//                                                                 offset: Offset(
//                                                                     0.00, 3.00),
//                                                                 color: blackColor
//                                                                     .withOpacity(
//                                                                         0.16),
//                                                                 blurRadius: 6,
//                                                               ),
//                                                             ],
//                                                             borderRadius:
//                                                                 getBoarderRadius(
//                                                                     18.00),
//                                                           ),
//                                                           child:
//                                                               ListView.builder(
//                                                                   // physics: NeverScrollableScrollPhysics(),
//                                                                   itemCount: authController
//                                                                       .mapBanksName[
//                                                                           'bank']
//                                                                       .length,
//                                                                   itemBuilder:
//                                                                       (context,
//                                                                           index) {
//                                                                     var mapData =
//                                                                         authController
//                                                                             .mapBanksName['bank'];
//                                                                     return GestureDetector(
//                                                                       onTap:
//                                                                           () {
//                                                                         authController
//                                                                             .setIsExpandedBanck();
//                                                                         authController
//                                                                             .setBanksNameSelected(mapData[index]);
//                                                                       },
//                                                                       child:
//                                                                           Container(
//                                                                         margin:
//                                                                             EdgeInsets.all(10),
//                                                                         child:
//                                                                             Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.end,
//                                                                           children: [
//                                                                             Text(
//                                                                               mapData[index]['name'],
//                                                                               textAlign: TextAlign.right,
//                                                                               style: getStyle(
//                                                                                 Color(0xff707070),
//                                                                                 FontWeight.w300,
//                                                                                 18,
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     );
//                                                                   }),
//                                                         ),
//                                                 ],
//                                               );
//                                             },
//                                           ),
//                                           SizedBox(
//                                             height: ScreenUtil().setHeight(12),
//                                           ),
//                                           Text(
//                                             "رقم الحساب ",
//                                             textAlign: TextAlign.right,
//                                             style: getStyle(
//                                               blackColor,
//                                               FontWeight.normal,
//                                               18,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: ScreenUtil().setHeight(12),
//                                           ),
//                                           CustomTextFiled(
//                                             onSaved: (value) =>
//                                                 setNumberAccountBank(value),
//                                             onValidate: (value) =>
//                                                 validationFamilyName(value),
//                                             keyboardType: TextInputType.number,
//                                           ),
//                                           SizedBox(
//                                             height: ScreenUtil().setHeight(12),
//                                           ),
//                                           Text(
//                                             "كلمة المرور ",
//                                             textAlign: TextAlign.right,
//                                             style: getStyle(
//                                               blackColor,
//                                               FontWeight.normal,
//                                               18.sp,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: ScreenUtil().setHeight(17),
//                                           ),
//                                           CustomTextFiled(
//                                             onSaved: (value) =>
//                                                 setPassword(value),
//                                             onValidate: (value) =>
//                                                 validationPassword(value),
//                                             isPassword: true,
//                                             keyboardType: TextInputType.text,
//                                           ),
//                                           SizedBox(
//                                             height: 14.h,
//                                           ),
//                                           Text(
//                                             "تأكيد كلمة المرور",
//                                             textAlign: TextAlign.right,
//                                             style: getStyle(
//                                               blackColor,
//                                               FontWeight.normal,
//                                               18.sp,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 17.h,
//                                           ),
//                                           CustomTextFiled(
//                                             onSaved: (value) =>
//                                                 setConfirmPassword(value),
//                                             onValidate: (value) =>
//                                                 validateConfirmPassword(value),
//                                             isPassword: true,
//                                             keyboardType: TextInputType.text,
//                                           ),
//                                           SizedBox(
//                                             height: 30.h,
//                                           ),
//                                           CustomButton(
//                                             title: 'تسجيل',
//                                             onTap: () async {
//                                               FocusScope.of(context).unfocus();

//                                               if (signUpKey.currentState
//                                                   .validate()) {
//                                                 signUpKey.currentState.save();

//                                                 if (authGet.image == null) {
//                                                   getSheetError(
//                                                       'الرجاء اختيار شعار خاص للأسرة');
//                                                 } else if (authGet
//                                                         .mapBanksNameSelected[
//                                                             'id']
//                                                         .toString() ==
//                                                     null) {
//                                                   getSheetError(
//                                                       'الرجاء اختيار اسم البنك');
//                                                 } else {
//                                                   Get.dialog(DialogAccept(
//                                                     title:
//                                                         '''هل توافق علي حضور العملاء الي موقعك \nلاخد طلباتهم دون الحاجة الي
//  مندوبين توصيل؟ ''',
//                                                     titleBtn1: 'نعم أوافق',
//                                                     titleBtn2: 'لا أوافق',
//                                                     onTap1: () async {
//                                                       await Server.server.registerFamily(
//                                                           nameFamily,
//                                                           mobile,
//                                                           authGet.image,
//                                                           password,
//                                                           confirmPassword,
//                                                           authGet.lat
//                                                               .toString(),
//                                                           authGet.long
//                                                               .toString(),
//                                                           authGet
//                                                                       .locationName
//                                                                       .value
//                                                                       .isEmpty ||
//                                                                   authGet.locationName
//                                                                           .value ==
//                                                                       null
//                                                               ? ''
//                                                               : authGet
//                                                                   .locationName
//                                                                   .value,
//                                                           authGet
//                                                               .mapBanksNameSelected[
//                                                                   'id']
//                                                               .toString(),
//                                                           numberAccountBank,
//                                                           '1');
//                                                     },
//                                                     onTap2: () async {
//                                                       await Server.server.registerFamily(
//                                                           nameFamily,
//                                                           mobile,
//                                                           authGet.image,
//                                                           password,
//                                                           confirmPassword,
//                                                           authGet.lat
//                                                               .toString(),
//                                                           authGet.long
//                                                               .toString(),
//                                                           authGet
//                                                                       .locationName
//                                                                       .value
//                                                                       .isEmpty ||
//                                                                   authGet.locationName
//                                                                           .value ==
//                                                                       null
//                                                               ? ''
//                                                               : authGet
//                                                                   .locationName
//                                                                   .value,
//                                                           authGet
//                                                               .mapBanksNameSelected[
//                                                                   'id']
//                                                               .toString(),
//                                                           numberAccountBank,
//                                                           '0');
//                                                     },
//                                                   ));
//                                                 }
//                                               }
//                                             },
//                                           ),
//                                           SizedBox(
//                                             height: 12.h,
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {
//                                               Get.offAll(SignInFamilyScreen());
//                                             },
//                                             child: Container(
//                                               width: ScreenUtil().setWidth(270),
//                                               height:
//                                                   ScreenUtil().setHeight(70),
//                                               child: Center(
//                                                 child: Text.rich(
//                                                   TextSpan(
//                                                     text: 'لدي حساب؟  ',
//                                                     style: getStyle(blackColor,
//                                                         FontWeight.normal, 16),
//                                                     children: [
//                                                       TextSpan(
//                                                         text: 'تسجيل دخول',
//                                                         style: GoogleFonts
//                                                             .montserrat(
//                                                           textStyle: TextStyle(
//                                                             fontSize: 16,
//                                                             color: orangeColor,
//                                                             decoration:
//                                                                 TextDecoration
//                                                                     .underline,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20.h,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
