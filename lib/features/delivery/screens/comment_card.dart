import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:delivery_boy/components/widgets/cash_network_image_share.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class CommentCard extends StatelessWidget {
  Map map;
  CommentCard(this.map);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
        vertical: ScreenUtil().setHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                map['comment'],
                textAlign: TextAlign.right,
                style: getStyle(blackColor, FontWeight.normal, 16),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(7),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: RatingBar.readOnly(
                  initialRating: double.parse(map['value']),
                  isHalfAllowed: true,
                  halfFilledIcon: Icons.star_half,
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  filledColor: orangeColor,
                  size: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          // Container(
          //   height: ScreenUtil().setHeight(40),
          //   width: ScreenUtil().setWidth(40),
          //   decoration: BoxDecoration(
          //     color: orangeColor,
          //     shape: BoxShape.circle,
          //   ),
          // ),
          CachedNetworkImageShare(map['image'], 40, 40, 0),
        ],
      ),
    );
  }
}
