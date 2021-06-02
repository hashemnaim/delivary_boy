import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:delivery_boy/backend/server.dart';
import 'package:delivery_boy/services/firebase_chat.dart';
import 'package:delivery_boy/services/sp_helper.dart';
import 'package:delivery_boy/state/app_family_get.dart';
import 'package:delivery_boy/utils/progress_dialog_utils.dart';

class ApiGet extends GetxController {
  AppFamilyGet appFamilyGet = Get.put(AppFamilyGet());
  var pr = ProgressDialogUtils.createProgressDialog(Get.context);

  Map listProductAdmin;
  Map<dynamic, dynamic> mapSubProductAdmin;
  String price;
  bool isEnableTextPrice = false;
  Map<dynamic, dynamic> mapProductSelected;
  Map<dynamic, dynamic> mapSubProductSelected;
  var mapProfile = {}.obs;
  var accountuserMap = {}.obs;
  var mapProductFamily = {}.obs;
  var offersMap = {}.obs;
  var contactMap = {}.obs;
  var osraOrderMap = [].obs;
  var osraNewsOrderMap = [].obs;
  var notAcceptdeliveryOrderMap = [].obs;
  var osraOrderDeyailsMap = {}.obs;
  var evaluteMap = {}.obs;
  var notificationMap = {}.obs;
  var listChats = [].obs;

  Map baqa = {};
  Map subBaqa = {};
  int indexSelectes;
  int index=1;
  int indexNav=1;
  int subSelexted;
  bool isExpandedProduct = false;
  bool isExpandedSubProduct = false;
  String type;
  var deliveryAllOrderMap = {}.obs;
  var deliveryOrderDeyailsMap2 = {}.obs;
  var orderDeliveryDetailsMap;

  var isOpen = false.obs;
  int numberOrdersDelivery = 0;
  int numberNotificationDelivery = 0;
  int numberNotificationOsra = 0;

  int countMessageUnRead = 0;
  testChat() async {
    await FireBaseHelper.fireBaseHelper
        .getAllMyChats(myId: mapProfile['userprofile'][0]['jawwal']);

    this.countMessageUnRead = 0;
    for (var i = 0; i < listChats.length; i++) {
      QuerySnapshot querySnapshot = await FireBaseHelper.fireBaseHelper
          .getAllChatMessagesWithoutStream(listChats[i]['mobile'].toString(),
              mapProfile['userprofile'][0]['jawwal']);

      for (var j = 0; j < querySnapshot.docs.length; j++) {
        if (querySnapshot.docs[j].data()['senderId'] ==
            mapProfile['userprofile'][0]['jawwal']) {
          this.countMessageUnRead = 0;
        } else {
          if (!querySnapshot.docs[j].data()['read']) {
            countMessageUnRead = countMessageUnRead + 1;
          }
        }

        update(['notification']);
      }
    }
  }
  setindexNav(indexNav) {
    this.indexNav = indexNav;
    update();
  }
  clear() {
    numberOrdersDelivery = 0;
    update(['notification']);
  }
setIndex(int index) {
    this.index = index;
    update(['index']);
  }
  changeNumberOrdersDelivery() async {
    await Server.server.orderdelivery();
    int number1 = notAcceptdeliveryOrderMap.length;
    int number2 = SPHelper.spHelper.getNumberOrdersDelivery() ?? 0;

    numberOrdersDelivery = number1;

    // if (number1 > number2) {
    //   numberOrdersDelivery = number1 - number2;
    //   // SPHelper.spHelper.setNumberOrdersDelivery(number1);
    //   update(['notification']);
    // } else if (number1 == number2) {
    //   numberOrdersDelivery = 0;
    //   update(['notification']);
    // }

    update(['notification']);
  }

  changeNumberNotificationDelivery() async {
    await Server.server.getAllrequestforuser();
    int number1 = notificationMap['purchase'].length;
    int number2 = SPHelper.spHelper.getNumberNotificationDelivery() ?? 0;
    if (number1 > number2) {
      numberNotificationDelivery = number1 - number2;
      SPHelper.spHelper.setNumberNotificationDelivery(number1);
    } else if (number1 == number2) {
      numberNotificationDelivery = 0;
    }

    update(['notification']);
  }

  changeNumberNotificationOsra() async {
    await Server.server.getAllrequestforuser();
    int number1 = notificationMap['purchase'].length;
    int number2 = SPHelper.spHelper.getNumberNotificationOsra() ?? 0;
    if (number1 > number2) {
      numberNotificationOsra = number1 - number2;
      SPHelper.spHelper.setNumberNotificationOsra(number1);
    } else if (number1 == number2) {
      numberNotificationOsra = 0;
    }

    update(['notification']);
  }

  setindexSelectes(int indexSelectes) {
    this.indexSelectes = indexSelectes;
    update(['baqa']);
  }

  setindexList(var listtt) {
    this.orderDeliveryDetailsMap = listtt;

    update(['listtt']);
  }

  setsubSelexted(int subSelexted) {
    this.subSelexted = subSelexted;
    update(['baqa']);
  }

  setBaqa(Map map) {
    this.baqa = map;
    update(['baqa']);
  }

  setSubBaqa(Map map) {
    this.subBaqa = map;
    update(['baqa']);
  }

  setPrice(String price) {
    this.price = price;
    update(['price']);
  }

  setIsEnableTextPrice() {
    this.isEnableTextPrice = !isEnableTextPrice;
    update(['price']);
  }

  setIsExpandedSubProduct() {
    isExpandedSubProduct = !isExpandedSubProduct;
    update(['mapSubProductAdmin']);
  }

  setmapSubProductSelected(Map<dynamic, dynamic> mapSubProductSelected) async {
    this.mapSubProductSelected = mapSubProductSelected;

    update(['mapSubProductAdmin']);
  }

  setIsExpandedBanck() {
    isExpandedProduct = !isExpandedProduct;
    update(['listProductAdmin']);
  }

  setMapProductSelected(Map<dynamic, dynamic> mapProductSelected) async {
    this.mapProductSelected = mapProductSelected;

    update(['listProductAdmin']);
  }

  getProductsName() async {
    Map list = await Server.server.getProductsName();
    this.listProductAdmin = list;
    update(['listProductAdmin']);
  }

  getSubProductsName(String productId) async {
    Map<dynamic, dynamic> map =
        await Server.server.getSubProductsName(productId);
    this.mapSubProductAdmin = map;
    update(['mapSubProductAdmin']);
  }

  getpriceproduct(String subProductId) async {
    Map<dynamic, dynamic> map =
        await Server.server.getpriceproduct(subProductId);
    setPrice(map['price'][0]['price'].toString());
  }
}
