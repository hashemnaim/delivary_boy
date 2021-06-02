import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/components/widgets/custom_text_filed_mobile.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class SendCodeScreen extends StatelessWidget {
  final int type;
  SendCodeScreen(this.type);
  String mobile;

  setMobile(String mobile) {
    this.mobile = mobile;
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

  GlobalKey<FormState> form2key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 250.h,
                child: Image.asset(
                  type == 0 ? home2jpg : backDeliverytopSvg,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
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
                          20,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.h,
                          ),
                          child: Form(
                            key: form2key,
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "رقم الجوال ",
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
                                CustomTextFieldMobile(
                                  onsaved: setMobile,
                                  validation: validationMobile,
                                ),
                                SizedBox(
                                  height: 108.h,
                                ),
                                CustomButton(
                                  title: 'ارسال ',
                                  onTap: () {
                                    FocusScope.of(context).unfocus();

                                    if (form2key.currentState.validate()) {
                                      form2key.currentState.save();
                                      Server.server.resetpassword(mobile, type);
                                    }
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
              )
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: ScreenUtil().setHeight(100),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: true,
                  iconTheme: IconThemeData(color: orangeColor),
                  // actions: [
                  //   Icon(Icons.arrow_forward),
                  // ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
