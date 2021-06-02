import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/auth_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/components/widgets/custom_text_field.dart';
import 'package:delivery_boy/features/delivery/screens/contact_us_screen.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class EditProfileDeliveryScreen extends StatelessWidget {
  ApiGet apiGet = Get.find();
  AuthGet authGet = Get.find();
  String mobile;
  String name;

  setMobile(String mobile) {
    this.mobile = mobile;
  }

  setName(String name) {
    this.name = name;
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

  validationFamilyName(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'هذا الحقل مطلوب *';
    }
  }

  GlobalKey<FormState> editDeliveryKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: orangeColor,
        appBar: AppBar(
          backgroundColor: orangeColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "الملف الشخصي",
            textAlign: TextAlign.right,
            style: getStyle(whiteColor, FontWeight.w700, 20),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.00),
                    topRight: Radius.circular(20.00),
                  ),
                ),
                child: Form(
                  key: editDeliveryKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              authGet.addImage();
                            },
                            child: GetBuilder<AuthGet>(
                                init: AuthGet(),
                                id: 'photo',
                                builder: (authController) {
                                  return authController.image == null
                                      ? CachedNetworkImageShare(
                                          apiGet.mapProfile['userprofile'][0]
                                              ['delivery']['imageform'],
                                          65,
                                          65,
                                          0)
                                      : Container(
                                          height: ScreenUtil().setHeight(44),
                                          width: ScreenUtil().setWidth(44),
                                          decoration: BoxDecoration(
                                            color: blackOpacityColor,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                authController.image,
                                              ),
                                            ),
                                          ),
                                        );
                                }),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(15),
                          ),
                          Text(
                            "تغيير الصورة",
                            textAlign: TextAlign.right,
                            style: getStyle(blackColor, FontWeight.normal, 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Text(
                        "الاسم ",
                        textAlign: TextAlign.right,
                        style: getStyle(blackColor, FontWeight.normal, 18),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      CustomTextFiled(
                        initialValue: apiGet.mapProfile['userprofile'][0]
                            ['name'],
                        keyboardType: TextInputType.text,
                        onSaved: setName,
                        onValidate: validationFamilyName,
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Text(
                        "رقم الجوال ",
                        textAlign: TextAlign.right,
                        style: getStyle(blackColor, FontWeight.normal, 18),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      CustomTextFiled(
                        initialValue: apiGet.mapProfile['userprofile'][0]
                            ['jawwal'],
                        keyboardType: TextInputType.number,
                        onSaved: setMobile,
                        onValidate: validationMobile,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(ContactUsScreen());
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(270),
                          height: ScreenUtil().setHeight(90),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'إذا كنت ترغب بتعديل بيانات أخري',
                                style:
                                    getStyle(blackColor, FontWeight.normal, 16),
                                children: [
                                  TextSpan(
                                    text: ' تواصل مع إدارة التطبيق ',
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: orangeColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text: ' الخاصة بنا',
                                  //   style:
                                  //       getStyle(blackColor, FontWeight.normal, 16),
                                  // ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomButton(
                        title: 'حفظ',
                        onTap: () async {
                          FocusScope.of(context).unfocus();

                          if (editDeliveryKey.currentState.validate()) {
                            editDeliveryKey.currentState.save();
                            
                            await Server.server
                                .editProfile(authGet.image, mobile, name);
                            authGet.image = null;
                          } else {}
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
