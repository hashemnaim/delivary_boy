import 'dart:io';

import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/values/color.dart';

class AuthGet extends GetxController {
  File image;
  double lat;
  double long;
  var locationName = ''.obs;
  File image1;
  File image2;
  File image3;
  File image4;
  bool isExpandedBanck = false;
  Map<dynamic, dynamic> mapBanksName;
  Map<dynamic, dynamic> mapBanksNameSelected;

  setIsExpandedBanck() {
    isExpandedBanck = !isExpandedBanck;
    update(['mapBanksName']);
  }

  setBanksNameSelected(Map<dynamic, dynamic> mapBanksNameSelected) async {
    this.mapBanksNameSelected = mapBanksNameSelected;

    update(['mapBanksName']);
  }

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

  addImage() async {
    try {
      File croppedFile = await imagePickerExample();

      if (croppedFile != null) {
        image = croppedFile;
        update(['photo']);
      }
    } catch (e) {}
  }

  addImage1() async {
    try {
      File croppedFile = await imagePickerExample();
      if (croppedFile != null) {
        image1 = croppedFile;
        update(['image1']);
      }
    } catch (e) {}
  }

  addImage2() async {
    try {
      File croppedFile = await imagePickerExample();
      if (croppedFile != null) {
        image2 = croppedFile;
        update(['image2']);
      }
    } catch (e) {}
  }

  addImage3() async {
    try {
      File croppedFile = await imagePickerExample();
      if (croppedFile != null) {
        image3 = croppedFile;
        update(['image3']);
      }
    } catch (e) {}
  }

  addImage4() async {
    try {
      File croppedFile = await imagePickerExample();
      if (croppedFile != null) {
        image4 = croppedFile;
        update(['image4']);
      }
    } catch (e) {}
  }
    Geolocator geolocator;

 Future<Geolocator> initGeolocator() async {
    if (geolocator == null) {
      geolocator = Geolocator();
      return geolocator;
    } else {
      return geolocator;
    }
  }
  Position currentPosition;

Future getCurrentLocation2() async {
    geolocator = await initGeolocator();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
      this.currentPosition = position;
        lat = position.latitude;
      long = position.longitude;
print(position.latitude);
      return currentPosition;
    }).catchError((e) {
      print(e);
    });
  }

  getCurrentLocation() async {
    print("position.latitude");

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      LatLng myLocation = LatLng(position.latitude, position.longitude);

      lat = position.latitude;
      long = position.longitude;
print(position.latitude);
      await getPlaceName(myLocation);
    } catch (e) {
      
    }
  }

  setLocationName(String locationName) {
    this.locationName.value = locationName;
  }

  getPlaceName(LatLng position) async {
    try {
      List<Address> addresses = await Geocoder.local
          .findAddressesFromCoordinates(
              Coordinates(position.latitude, position.longitude));
      Address first = addresses[0];

      setLocationName(first.addressLine);
    } catch (e) {
      setLocationName('');
    }
  }

  getBancks() async {
    Map<dynamic, dynamic> map = await Server.server.getBanksName();
    this.mapBanksName = map;
    update(['mapBanksName']);
  }
}
