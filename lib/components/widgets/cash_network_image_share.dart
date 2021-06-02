import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CachedNetworkImageShare extends StatelessWidget {
  final String urlImage;
  final int widthNumber;
  final int heigthNumber;
  final double borderNumber;

  CachedNetworkImageShare(
      this.urlImage, this.heigthNumber, this.widthNumber, this.borderNumber);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: getBoarderRadius(ScreenUtil().setHeight(borderNumber)),
        child: Container(
          width: widthNumber == 0
              ? double.infinity
              : ScreenUtil().setWidth(widthNumber),
          height: ScreenUtil().setHeight(heigthNumber),
          decoration: BoxDecoration(
            shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => SkeletonAnimation(
        borderRadius: getBoarderRadius(ScreenUtil().setHeight(widthNumber)),
        shimmerColor: Colors.grey,
        child: Container(
          width: ScreenUtil().setWidth(widthNumber),
          height: ScreenUtil().setHeight(heigthNumber),
          decoration: BoxDecoration(
            shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
            color: Colors.grey[300],
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: ScreenUtil().setWidth(widthNumber),
        height: ScreenUtil().setHeight(heigthNumber),
        decoration: BoxDecoration(
          color: orangeColor,
          shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
