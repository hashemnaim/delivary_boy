import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/components/widgets/custom_text_field.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final int type;
  final String mobile;
  ForgetPasswordScreen(this.type, this.mobile);
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

  setPassword(String password) {
    this.password = password;
  }

  validationPassword(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'هذا الحقل مطلوب *';
    }
  }

  GlobalKey<FormState> keyForget = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: Get.width,
                height: 250.h,
                child: Image.asset(
                  type == 0 ? home1jpg : backDeliverytopSvg,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  child: Form(
                    key: keyForget,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "نسيت كلمة المرور ",
                          textAlign: TextAlign.right,
                          style: getStyle(
                            blackColor,
                            FontWeight.w700,
                            20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.h),
                          child: ListView(
                            children: [
                              Text(
                                "كلمة المرور ",
                                textAlign: TextAlign.right,
                                style: getStyle(
                                  blackColor,
                                  FontWeight.normal,
                                  18.sp,
                                ),
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              CustomTextFiled(
                                onSaved: setPassword,
                                onValidate: validationPassword,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                "إعاده كلمة المرور ",
                                textAlign: TextAlign.right,
                                style: getStyle(
                                  blackColor,
                                  FontWeight.normal,
                                  18,
                                ),
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              CustomTextFiled(
                                onSaved: setConfirmPassword,
                                onValidate: validateConfirmPassword,
                              ),
                              SizedBox(
                                height: 163.h,
                              ),
                              CustomButton(
                                title: 'حفظ',
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (keyForget.currentState.validate()) {
                                    keyForget.currentState.save();
                                    Server.server.changepassword(
                                        mobile, password, confirmPassword);
                                  } else {}
                                },
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 100.h,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
