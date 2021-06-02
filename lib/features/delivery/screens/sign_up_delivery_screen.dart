import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery_boy/backend/auth_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/components/widgets/custom_drop_down.dart';
import 'package:delivery_boy/components/widgets/custom_select_photo.dart';
import 'package:delivery_boy/components/widgets/custom_text_field.dart';
import 'package:delivery_boy/components/widgets/custom_text_filed_mobile.dart';
import 'package:delivery_boy/features/delivery/screens/sign_in_delivery.dart';
import 'package:delivery_boy/features/families/widgets/dialog_family.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class SignUpDeliveryScreen extends StatelessWidget {
  AuthGet authGet = Get.find();
  String nameDelivery;
  String numberId;
  String nationality;
  String mobile;
  String numberAccountBank;
  String password;
  String confirmPassword;

  setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }

  validateConfirmPassword(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'هذا الحقل مطلوب *';
    }
    // else if (value.length < 8) {
    //   return 'password_error'.tr;
    // }
    else if (this.confirmPassword != this.password) {
      return 'كلمتا المرور غير متطابقتين';
    }
  }

  setNameDelivery(String nameDelivery) {
    this.nameDelivery = nameDelivery;
  }

  setNumberAccountBank(String numberAccountBank) {
    this.numberAccountBank = numberAccountBank;
  }

  setNationality(String nationality) {
    this.nationality = nationality;
  }

  setNumberId(String numberId) {
    this.numberId = numberId;
  }

  setMobile(String mobile) {
    this.mobile = mobile;
  }

  setPassword(String password) {
    this.password = password;
  }

  validationPassword(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'هذا الحقل مطلوب *';
    }
  }

  validationMobile(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'هذا الحقل مطلوب *';
    } else if (!GetUtils.isNum(value)) {
      return 'رقم الهاتف يحتوي علي أرقام فقط';
    }
    // else if (value.length != 10) {
    //   return 'error_mobile_length'.tr;
    // }
  }

  validationString(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'هذا الحقل مطلوب *';
    }
  }

  GlobalKey<FormState> signUpFamilyKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: ScreenUtil().setHeight(250),
                child: Image.asset(
                  backDeliverytopSvg,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 1,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Text(
                          "تسجيل حساب ",
                          textAlign: TextAlign.right,
                          style: getStyle(
                            blackColor,
                            FontWeight.w700,
                            20,
                          ),
                        ),
                        // SizedBox(
                        //   height: ScreenUtil().setHeight(20),
                        // ),
                     
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(
                              20,
                            )),
                            child: Form(
                              key: signUpFamilyKey,
                              child: ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "الاسم كامل ",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      CustomTextFiled(
                                        onSaved: (value) =>
                                            setNameDelivery(value),
                                        onValidate: (value) =>
                                            validationString(value),
                                        keyboardType: TextInputType.text,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Text(
                                        "رقم الهوية",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      CustomTextFiled(
                                        onSaved: (value) =>
                                            setNumberId(value),
                                        onValidate: (value) =>
                                            validationString(value),
                                        keyboardType: TextInputType.number,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Text(
                                        "المدينة",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Obx(() {
                                        return CustomTextFiled(
                                          initialValue:
                                              authGet.locationName.value,
                                          onSaved: (value) => authGet
                                              .setLocationName(value),
                                          onValidate: (value) =>
                                              validationString(value),
                                        );
                                      }),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      // Text(
                                      //   "الجنسية",
                                      //   textAlign: TextAlign.right,
                                      //   style: getStyle(
                                      //     blackColor,
                                      //     FontWeight.normal,
                                      //     18,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: ScreenUtil().setHeight(12),
                                      // ),
                                      // CustomTextFiled(
                                      //   onSaved: (value) =>
                                      //       setNationality(value),
                                      //   onValidate: (value) =>
                                      //       validationString(value),
                                      //   keyboardType: TextInputType.text,
                                      // ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Text(
                                        "صورة الرخصة ",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenUtil().setHeight(15)),
                                      Container(
                                        height: 70.h,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: GetBuilder<AuthGet>(
                                              init: AuthGet(),
                                              id: 'image1',
                                              builder: (authController) {
                                                return CustomSelectPhoto(
                                                  image:
                                                      authController.image1,
                                                  onTap: authController
                                                      .addImage1,
                                                );
                                              }),
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Text(
                                        "صورة السيارة من الامام ",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenUtil().setHeight(15)),
                                      Container(
                                        height: 70.h,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: GetBuilder<AuthGet>(
                                              init: AuthGet(),
                                              id: 'image2',
                                              builder: (authController) {
                                                return CustomSelectPhoto(
                                                  image:
                                                      authController.image2,
                                                  onTap: authController
                                                      .addImage2,
                                                );
                                              }),
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Text(
                                        "صورة السيارة من الخلف ",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenUtil().setHeight(15)),
                                      Container(
                                        height: 70.h,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: GetBuilder<AuthGet>(
                                              init: AuthGet(),
                                              id: 'image3',
                                              builder: (authController) {
                                                return CustomSelectPhoto(
                                                  image:
                                                      authController.image3,
                                                  onTap: authController
                                                      .addImage3,
                                                );
                                              }),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              ScreenUtil().setHeight(15)),
                                      // Text(
                                      //   "صورة الشعار ",
                                      //   textAlign: TextAlign.right,
                                      //   style: getStyle(
                                      //     blackColor,
                                      //     FontWeight.normal,
                                      //     18,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //     height:
                                      //         ScreenUtil().setHeight(15)),
                                      // Container(
                                      //   height: 70.h,
                                      //   child: Directionality(
                                      //     textDirection: TextDirection.rtl,
                                      //     child: GetBuilder<AuthGet>(
                                      //         init: AuthGet(),
                                      //         id: 'image4',
                                      //         builder: (authController) {
                                      //           return CustomSelectPhoto(
                                      //             image:
                                      //                 authController.image4,
                                      //             onTap: authController
                                      //                 .addImage4,
                                      //           );
                                      //         }),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: ScreenUtil().setHeight(12),
                                      // ),
                                      Text(
                                        "رقم الجوال",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      CustomTextFieldMobile(
                                        onsaved: setMobile,
                                        validation: validationMobile,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      // Text(
                                      //   "اسم البنك ",
                                      //   textAlign: TextAlign.right,
                                      //   style: getStyle(
                                      //     blackColor,
                                      //     FontWeight.normal,
                                      //     18,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: ScreenUtil().setHeight(12),
                                      // ),
                                      // GetBuilder<AuthGet>(
                                      //   id: 'mapBanksName',
                                      //   init: AuthGet(),
                                      //   builder: (authController) {
                                      //     return Column(
                                      //       children: [
                                      //         GestureDetector(
                                      //           onTap: () {
                                      //             authController
                                      //                 .setIsExpandedBanck();
                                      //           },
                                      //           child: CustomDropDownButton(
                                      //             title: authController
                                      //                         .mapBanksNameSelected ==
                                      //                     null
                                      //                 ? 'اسم البنك'
                                      //                 : authController
                                      //                         .mapBanksNameSelected[
                                      //                     'name'],
                                      //             isCheck: authController
                                      //                 .isExpandedBanck,
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 8.h,
                                      //         ),
                                      //         !authController
                                      //                 .isExpandedBanck
                                      //             ? Container()
                                      //             : Container(
                                      //                 height: ScreenUtil()
                                      //                     .setHeight(authController
                                      //                             .mapBanksName[
                                      //                                 'bank']
                                      //                             .length *
                                      //                         50),
                                      //                 width: ScreenUtil()
                                      //                     .setWidth(335),
                                      //                 decoration:
                                      //                     BoxDecoration(
                                      //                   color: whiteColor,
                                      //                   boxShadow: [
                                      //                     BoxShadow(
                                      //                       offset: Offset(
                                      //                           0.00, 3.00),
                                      //                       color: blackColor
                                      //                           .withOpacity(
                                      //                               0.16),
                                      //                       blurRadius: 6,
                                      //                     ),
                                      //                   ],
                                      //                   borderRadius:
                                      //                       getBoarderRadius(
                                      //                           18.00),
                                      //                 ),
                                      //                 child:
                                      //                     ListView.builder(
                                      //                         // physics: NeverScrollableScrollPhysics(),
                                      //                         itemCount: authController
                                      //                             .mapBanksName[
                                      //                                 'bank']
                                      //                             .length,
                                      //                         itemBuilder:
                                      //                             (context,
                                      //                                 index) {
                                      //                           var mapData =
                                      //                               authController
                                      //                                   .mapBanksName['bank'];
                                      //                           return GestureDetector(
                                      //                             onTap:
                                      //                                 () {
                                      //                               authController
                                      //                                   .setIsExpandedBanck();
                                      //                               authController
                                      //                                   .setBanksNameSelected(mapData[index]);
                                      //                             },
                                      //                             child:
                                      //                                 Container(
                                      //                               margin:
                                      //                                   EdgeInsets.all(10),
                                      //                               child:
                                      //                                   Row(
                                      //                                 mainAxisAlignment:
                                      //                                     MainAxisAlignment.end,
                                      //                                 children: [
                                      //                                   Text(
                                      //                                     mapData[index]['name'],
                                      //                                     textAlign: TextAlign.right,
                                      //                                     style: getStyle(
                                      //                                       Color(0xff707070),
                                      //                                       FontWeight.w300,
                                      //                                       18,
                                      //                                     ),
                                      //                                   ),
                                      //                                 ],
                                      //                               ),
                                      //                             ),
                                      //                           );
                                      //                         }),
                                      //               ),
                                      //       ],
                                      //     );
                                      //   },
                                      // ),
                                      // SizedBox(
                                      //   height: ScreenUtil().setHeight(12),
                                      // ),
                                      // Text(
                                      //   "رقم الحساب ",
                                      //   textAlign: TextAlign.right,
                                      //   style: getStyle(
                                      //     blackColor,
                                      //     FontWeight.normal,
                                      //     18,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: ScreenUtil().setHeight(12),
                                      // ),
                                      // CustomTextFiled(
                                      //   onSaved: (value) =>
                                      //       setNumberAccountBank(value),
                                      //   onValidate: (value) =>
                                      //       validationString(value),
                                      //   keyboardType: TextInputType.number,
                                      // ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Text(
                                        "كلمة المرور ",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      CustomTextFiled(
                                        onSaved: (value) =>
                                            setPassword(value),
                                        onValidate: (value) =>
                                            validationPassword(value),
                                        isPassword: true,
                                        keyboardType: TextInputType.text,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      Text(
                                        "تأكيد كلمة المرور",
                                        textAlign: TextAlign.right,
                                        style: getStyle(
                                          blackColor,
                                          FontWeight.normal,
                                          18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      CustomTextFiled(
                                        isPassword: true,
                                        onSaved: (value) =>
                                            setConfirmPassword(value),
                                        onValidate: (value) =>
                                            validateConfirmPassword(value),
                                        keyboardType: TextInputType.text,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(35),
                                      ),
                                      CustomButton(
                                        title: 'تسجيل',
                                        onTap: () {
                                          FocusScope.of(context).unfocus();

                                          if (signUpFamilyKey.currentState
                                              .validate()) {
                                            signUpFamilyKey.currentState
                                                .save();
                                            Get.dialog(DialogAccept(
                                              title: '''هل انت متفرغ
بشكل كامل؟''',
                                              titleBtn1: 'نعم ',
                                              titleBtn2: 'لا',
                                              higth: 244,
                                              onTap2: () async {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                Get.back();
                                                if (authGet.image2 == null ||
                                                    authGet.image1 ==
                                                        null ||
                                                    authGet.image3 ==null 
                                                   ) {
                                                  getSheetError(
                                                      'الرجاء تحديد جميع الصور اللازمة');
                                                } else {
                                                  await Server.server.registerDelivery(
                                                      nameDelivery,
                                                      mobile,
                                                      nationality,
                                                      authGet.locationName.value
                                                                  .isEmpty ||
                                                              authGet
                                                                      .locationName
                                                                      .value ==
                                                                  null
                                                          ? 'Palestine'
                                                          : authGet
                                                              .locationName
                                                              .value,
                                                      numberId,
                                                      authGet.image2,
                                                      authGet.image3,
                                                      authGet.image1,
                                                      authGet.image4,
                                                      authGet
                                                          .mapBanksNameSelected[
                                                              'id']
                                                          .toString(),
                                                      numberAccountBank,
                                                      password,
                                                      confirmPassword,
                                                      authGet.lat
                                                          .toString(),
                                                      authGet.long
                                                          .toString(),
                                                      '0');
                                                }
                                              },
                                              onTap1: () async {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                Get.back();
                                                if (authGet.image2 == null ||
                                                    authGet.image1 ==
                                                        null ||
                                                    authGet.image3 ==
                                                        null) {
                                                  getSheetError(
                                                      'الرجاء تحديد جميع الصور اللازمة');
                                                } else {
                                                  await Server.server.registerDelivery(
                                                      nameDelivery,
                                                      mobile,
                                                      nationality,
                                                      authGet.locationName.value
                                                                  .isEmpty ||
                                                              authGet
                                                                      .locationName
                                                                      .value ==
                                                                  null
                                                          ? 'Palestine'
                                                          : authGet
                                                              .locationName
                                                              .value,
                                                      numberId,
                                                      authGet.image2,
                                                      authGet.image3,
                                                      authGet.image1,
                                                      authGet.image4,
                                                      authGet
                                                          .mapBanksNameSelected[
                                                              'id']
                                                          .toString(),
                                                      numberAccountBank,
                                                      password,
                                                      confirmPassword,
                                                      authGet.lat
                                                          .toString(),
                                                      authGet.long
                                                          .toString(),
                                                      '1');
                                                }
                                              },
                                            ));
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(12),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.offAll(
                                              SignInDeliveryScreen());
                                        },
                                        child: Container(
                                          width: ScreenUtil().setWidth(270),
                                          height:
                                              ScreenUtil().setHeight(70),
                                          child: Center(
                                            child: Text.rich(
                                              TextSpan(
                                                text: 'لدي حساب؟  ',
                                                style: getStyle(blackColor,
                                                    FontWeight.normal, 16),
                                                children: [
                                                  TextSpan(
                                                    text: 'تسجيل دخول',
                                                    style: GoogleFonts
                                                        .montserrat(
                                                      textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: orangeColor,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Obx(
          //   () {
          //     return Visibility(
          //       visible: authGet.isRegisterSucsses.value,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Center(child: CircularProgressIndicator()),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
