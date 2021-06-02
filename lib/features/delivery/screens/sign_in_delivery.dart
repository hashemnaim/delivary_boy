import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery_boy/backend/auth_get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/components/widgets/custom_text_field.dart';
import 'package:delivery_boy/components/widgets/custom_text_filed_mobile.dart';
import 'package:delivery_boy/features/delivery/screens/sign_up_delivery_screen.dart';
import 'package:delivery_boy/features/delivery/screens/send_code_screen.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class SignInDeliveryScreen extends StatelessWidget {
  AuthGet authGet = Get.find();

  String mobile;
  String password;

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
    // else
    // if (value.length != 10) {
    //   return translator.translate('error_mobile_length');
    // }
  }

  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
        child: Form(
          key: signInKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               SizedBox(
                height: ScreenUtil().setHeight(60),
              ),
               Container(
            width: double.infinity,
                // height: ScreenUtil().setHeight(250),
            child: Image.asset(
                            "assets/svgs/van.gif",

              fit: BoxFit.fill,
            ),
          ),
              Center(
                child: Text(
                  "أهلا وسهلا بك",
                  textAlign: TextAlign.right,
                  style: getStyle(
                    blackColor,
                    FontWeight.w700,
                    20,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Text(
                "رقم الجوال ",
                textAlign: TextAlign.right,
                style: getStyle(
                  blackColor,
                  FontWeight.normal,
                  18,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              CustomTextFieldMobile(
                onsaved: setMobile,
                validation: validationMobile,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
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
                onSaved: (value) => setPassword(value),
                onValidate: (value) => validationPassword(value),
                isPassword: true,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              CustomButton(
                title: 'دخول ',
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  if (signInKey.currentState.validate()) {
                    signInKey.currentState.save();
                    await Server.server.login(mobile, password,
                        authGet.lat.toString(), authGet.long.toString());
                  }
                },
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SendCodeScreen(1));
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "نسيت كلمة المرور؟",
                    textAlign: TextAlign.right,
                    style: getStyle(
                      blackColor,
                      FontWeight.normal,
                      16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SignUpDeliveryScreen());
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      text: 'ليس لدي حساب؟  ',
                      style: getStyle(blackColor, FontWeight.w300, 16),
                      children: [
                        TextSpan(
                          text: ' تسجيل حساب',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: orangeColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
