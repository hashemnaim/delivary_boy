import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:delivery_boy/values/constant.dart';

class CustomTextFieldMobile extends StatelessWidget {
  final Function onsaved;
  final Function validation;

  const CustomTextFieldMobile({this.onsaved, this.validation});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: blackOpacityColor,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(18.00),
        ),
        border: Border.all(
          width: 0.50,
          color: blackOpacityColor,
        ),
      ),
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Row(
          children: [
            Expanded(
              child: Container(
                // height: 50,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     width: 0.50,
                //     color: blackOpacityColor,
                //   ),
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(18.00),
                //     bottomLeft: Radius.circular(18.00),
                //   ),
                // ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.00),
                      bottomLeft: Radius.circular(18.00),
                    ),
                    child: Container(
                      // height: 50,
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //   width: 0.50,
                          //   color: blackOpacityColor,
                          // ),
                          ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 10.0, bottom: 5, left: 10, right: 10),
                            fillColor: whiteColor,
                            filled: true,
                            border: InputBorder.none),
                        onSaved: (newValue) => onsaved(newValue),
                        validator: (value) => validation(value),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            VerticalDivider(),
            Container(
              height: 50,
              width: ScreenUtil().setWidth(90),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "+970",
                      textAlign: TextAlign.right,
                      style: getStyle(blackColor, FontWeight.w300, 18),
                    ),
                    // SvgPicture.asset(
                    //   flagSvg,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
