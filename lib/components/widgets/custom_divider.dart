import 'package:flutter/material.dart';
import 'package:delivery_boy/values/color.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.00,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteOpacityColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 3.00),
            color: blackColor.withOpacity(0.16),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}
