import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class ContactUsScreen extends StatelessWidget {
  String message;
  setMessage(String message) {
    this.message = message;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "الدعم والمساعدة ",
            textAlign: TextAlign.right,
            style: getStyle(whiteColor, FontWeight.w700, 16),
          ),
          backgroundColor: orangeColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.00)),
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: whiteColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تواصل معنا عن طريق الايميل  ",
                textAlign: TextAlign.right,
                style: getStyle(blackColor, FontWeight.w700, 20),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Text(
                "الرسالة",
                textAlign: TextAlign.right,
                style: getStyle(blackColor, FontWeight.normal, 18),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 0.50,
                  //     color: blackOpacityColor,
                  //   ),
                  //   borderRadius: BorderRadius.circular(18.00),
                  // ),
                  child: TextFormField(
                    maxLines: 4,
                    maxLength: 200,
                    onChanged: (value) {
                      setMessage(value);
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          top: 10.0, bottom: 5, left: 10, right: 10),
                      fillColor: whiteColor,
                      filled: true,
                      // border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: getBoarderRadius(18),
                        borderSide:
                            BorderSide(width: 0.50, color: Color(0xffd2d2d2)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: getBoarderRadius(18),
                        borderSide:
                            BorderSide(width: 0.50, color: Color(0xffd2d2d2)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(80),
              ),
              CustomButton(
                title: 'إرسال',
                onTap: () async {
                  FocusScope.of(context).unfocus();

                  await Server.server.conectUs(message);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
