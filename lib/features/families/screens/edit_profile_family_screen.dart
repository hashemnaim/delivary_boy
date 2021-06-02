import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/api_get.dart';
import 'package:delivery_boy/backend/auth_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/components/widgets/custom_text_field.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class EditProfileFamilyScreen extends StatelessWidget {
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

  GlobalKey<FormState> editKey = GlobalKey<FormState>();
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
                  key: editKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                              ['osra_user']['image'],
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
                            "تغيير الشعار",
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
                        height: ScreenUtil().setHeight(15),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(90),
                      ),
                      CustomButton(
                        title: 'حفظ',
                        onTap: () async {
                          FocusScope.of(context).unfocus();

                          if (editKey.currentState.validate()) {
                            editKey.currentState.save();
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
