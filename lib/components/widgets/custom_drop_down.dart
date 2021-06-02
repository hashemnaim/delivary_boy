import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class CustomDropDownButton extends StatelessWidget {
  final bool isCheck;
  final bool isChoose;
  final String title;

  const CustomDropDownButton({this.isCheck, this.title, this.isChoose = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
          width: 0.50,
          color: blackOpacityColor,
        ),
        borderRadius: getBoarderRadius(18),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !isChoose
                ? isCheck
                    ? Icon(Icons.arrow_drop_up)
                    : Icon(Icons.arrow_drop_down)
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: getStyle(
                    Color(0xff535353),
                    FontWeight.normal,
                    18,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(15),
                ),
                isChoose
                    ? isCheck
                        ? SvgPicture.asset(
                            checkCompleteSvg,
                          )
                        : SvgPicture.asset(
                            checkNoCompleteSvg,
                          )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
