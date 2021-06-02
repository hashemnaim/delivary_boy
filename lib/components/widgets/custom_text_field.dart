import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class CustomTextFiled extends StatefulWidget {
  final Function onSaved;
  final Function onValidate;
  final int maxLength;
  final bool isPassword;
  final TextInputType keyboardType;
  final String initialValue;
  final FocusNode focaseNode;
  final bool isLocation;
  final String hintText;

  CustomTextFiled({
    this.onSaved,
    this.onValidate,
    this.maxLength,
    this.keyboardType,
    this.initialValue,
    this.focaseNode,
    this.hintText,
    this.isLocation = false,
    this.isPassword = false,
  });

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isSecret = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(18.00),
          ),
          child: TextFormField(
            obscureText: isSecret,
            initialValue: widget.initialValue,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLength == 200 ? 4 : 1,
            maxLength: widget.maxLength,
            onChanged: (value) {
              widget.onSaved(value);
              
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        isSecret = !isSecret;
                        setState(() {});
                      },
                      child: Icon(
                        !isSecret
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: blackColor,
                      ),
                    )
                  : null,
              contentPadding: const EdgeInsets.only(
                  top: 10.0, bottom: 5, left: 10, right: 10),
              fillColor: whiteColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: getBoarderRadius(18),
                borderSide: BorderSide(width: 0.50, color: Color(0xffd2d2d2)),
              ),
              border: OutlineInputBorder(
                borderRadius: getBoarderRadius(18),
                borderSide: BorderSide(width: 0.50, color: Color(0xffd2d2d2)),
              ),
              prefix: widget.isLocation
                  ? Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: orangeColor,
                    )
                  : null,
            ),
            onSaved: (value) {
              widget.onSaved(value);
            },
            validator: (value) {
              // FocusScope.of(context).unfocus();
              return widget.onValidate(value);
            },
          ),
        ),
      ),
    );
  }
}
