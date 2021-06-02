import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: orangeColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "سياسة الخصوصية",
            textAlign: TextAlign.right,
            style: getStyle(whiteColor, FontWeight.w700, 20),
          ),
        ),
        body: PDF(
          swipeHorizontal: true,
        ).cachedFromUrl('https://san3h.com/images/p1.pdf'),
      ),
    );
  }
}
