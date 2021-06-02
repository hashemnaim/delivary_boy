 import 'package:flutter/material.dart';
 import 'package:progress_dialog/progress_dialog.dart';
import 'package:delivery_boy/values/color.dart';
  // progress_dialog: ^1.2.4

class ProgressDialogUtils extends ProgressDialog {
  static ProgressDialog pr;

  ProgressDialogUtils(BuildContext context) : super(context);

  static ProgressDialog createProgressDialog(BuildContext context) {
    pr = pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
      message: 'الرجاء الإنتظار',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressTextStyle: TextStyle(
          color: primaryColor, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.normal),
    );
    return pr;
  }

  void showProgressDialog() {
    if (pr != null) {
      pr.show();
    }
  }

  void hideProgressDialog() {
    if (pr != null) {
      pr.hide();
    }
  }
}
