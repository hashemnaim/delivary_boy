import 'package:delivery_boy/values/color.dart';
import 'package:flutter/material.dart';

class IsLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 

    
    Container(
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 8,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(orangeColor),
          strokeWidth: 7,
        ),
      ),
   );
  }
}
