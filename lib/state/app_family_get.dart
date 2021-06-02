import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:delivery_boy/values/color.dart';

class AppFamilyGet extends GetxController {
  int curStep = 0;
  bool showDetailsOrders = false;

  File imageProduct;
  int numberExtra = 1;
  int numberHeight = 60;
  Map mapExtra = {};

  Future<File> imagePickerExample() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    try {
      File croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          aspectRatioPresets: Platform.isAndroid
              ? [
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio16x9
                ]
              : [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio5x3,
                  CropAspectRatioPreset.ratio5x4,
                  CropAspectRatioPreset.ratio7x5,
                  CropAspectRatioPreset.ratio16x9
                ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: orangeColor,
              toolbarWidgetColor: whiteColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            title: 'Cropper',
          ));
      return croppedFile;
    } catch (e) {
      return null;
    }
  }

  addMapExtra(String name, String price) {
    
    this.mapExtra.addAll({'\"$name\"': '\"$price\"'});
    
    update(['extraMap']);
  }

  addNumberExtra() {
    this.numberExtra += 1;
    this.numberHeight += 50;
    update(['extraMap']);
  }
   reset() {
    this.numberExtra = 1;
    this.numberHeight = 50;
    update(['extraMap']);
  }

  addImageProduct() async {
    try {
      File croppedFile = await imagePickerExample();
      if (croppedFile != null) {
        imageProduct = croppedFile;
        update(['imageProduct']);
      }
    } catch (e) {}
  }

  setCurentStep(int curSter) {
    this.curStep = curSter;
    

    update(['stepper']);
  }

  setShowDetailsOrders(bool showDetailsOrders) {
    this.showDetailsOrders = showDetailsOrders;
    
    update(['stepper']);
  }
}
