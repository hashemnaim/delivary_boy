import 'package:flutter/material.dart';
import 'package:delivery_boy/values/color.dart';
import 'package:delivery_boy/values/common.dart';

class StepProgressView extends StatelessWidget {
  final double _width;
  final List<IconData> _icons;
  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Color(0xfff2f1f1);
  final double lineWidth = 4.0;
  StepProgressView(
      {Key key,
      @required List<IconData> icons,
      @required int curStep,
      List<String> titles,
      @required double width,
      @required Color color})
      : _icons = icons,
        _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(curStep > 0 == true && curStep <= icons.length + 1),
        assert(width > 0),
        super(key: key);
  List<Widget> _iconViews() {
    var list = <Widget>[];
    _icons.asMap().forEach((i, icon) {
      //colors according to state
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;

      // var iconColor =
      //     (i == 0 || _curStep > i + 1) ? _inactiveColor : _activeColor;

      list.add(
        //dot with icon view
        Container(
          width: 25,
          height: 25,
          padding: EdgeInsets.all(0),
          // child: Icon(icon, color: iconColor,size: 15.0,),
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: BorderRadius.all(new Radius.circular(25.0)),
            border: Border.all(
              color: circleColor,
              width: 2.0,
            ),
          ),
        ),
      );

      //line between icons
      if (i != _icons.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : blackColor;
      list.add(Text(text, style: TextStyle(color: circleColor)));
      Text(
        text,
        textAlign: TextAlign.center,
         style: getStyle(circleColor, FontWeight.w300, 18),
      );
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: 32.0,
          left: 24.0,
          right: 24.0,
        ),
        width: this._width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            if (_titles != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _titleViews(),
              ),
          ],
        ));
  }
}
