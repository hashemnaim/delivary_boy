import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper spHelper = SPHelper._();

  SharedPreferences sharedPreferences;

  Future<SharedPreferences> initSharedPrefrences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences;
    } else {
      return sharedPreferences;
    }
  }

  setTokenFamily(String value) async {
    sharedPreferences.setString('accessTokenFamily', value);
  }

  String getTokenFamily() {
    String x = sharedPreferences.getString('accessTokenFamily');
    return x;
  }

  setTokenDelivery(String value) {
    sharedPreferences.setString('accessTokenDelivery', value);
  }

  String getTokenDelivery() {
    String x = sharedPreferences.getString('accessTokenDelivery');
    return x;
  }

  setType(String value) async {
    sharedPreferences.setString('type', value);
  }

  String getType() {
    String x = sharedPreferences.getString('type');
    return x;
  }

  setNumberOrdersDelivery(int value) {
    sharedPreferences.setInt('numberOrders', value);
  }

  int getNumberOrdersDelivery() {
    int number = sharedPreferences.getInt('numberOrders');
    return number;
  }

  setNumberNotificationDelivery(int value) {
    sharedPreferences.setInt('NumberNotificationDelivery', value);
  }

  int getNumberNotificationDelivery() {
    int number = sharedPreferences.getInt('NumberNotificationDelivery');
    return number;
  }
  setNumberNotificationOsra(int value) {
    sharedPreferences.setInt('NumberNotificationOsra', value);
  }

  int getNumberNotificationOsra() {
    int number = sharedPreferences.getInt('NumberNotificationOsra');
    return number;
  }
    String getToken() {
    String x = sharedPreferences.getString('accessToken');
    return x;
  }
}
