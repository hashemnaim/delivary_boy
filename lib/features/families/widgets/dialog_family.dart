import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/components/widgets/custom_button.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class DialogAccept extends StatelessWidget {
  final String title;
  final String titleBtn1;
  final String titleBtn2;
  final Function onTap1;
  final Function onTap2;
  final int higth;
  DialogAccept(
      {this.title,
      this.titleBtn1,
      this.titleBtn2,
      this.onTap1,
      this.onTap2,
      this.higth = 280});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(0),
      child: ClipRRect(
        child: Container(
          height: ScreenUtil().setHeight(higth),
          width: ScreenUtil().setWidth(335),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 3.00),
                color: blackColor.withOpacity(0.16),
                blurRadius: 6,
              ),
            ],
            borderRadius: getBoarderRadius(41.00),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Almarai",
                  fontSize: 18,
                  height: 1.3,
                  color: Color(0xff000000),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    title: titleBtn2,
                    width: 129,
                    colorButton: whiteColor,
                    onTap: onTap2,
                  ),
                  CustomButton(
                    title: titleBtn1,
                    width: 129,
                    onTap: onTap1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
