import 'package:crafty_bay/data/Utils/urls.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> createProfile({
    required String customerName,
    required String customerAddress,
    required String customerCity,
    required String customerState,
    required String customerPostCode,
    required String customerCountry,
    required String customerPhone,
    required String customerFax,
    required String shippingName,
    required String shippingAddress,
    required String shippingCity,
    required String shippingState,
    required String shippingPostCode,
    required String shippingCountry,
    required String shippingPhone,
    required String token,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      url: Urls.createProfileUrl,
      body: {
        "cus_name": customerName,
        "cus_add": customerAddress,
        "cus_city": customerCity,
        "cus_state": customerState,
        "cus_postcode": customerPostCode,
        "cus_country": customerCountry,
        "cus_phone": customerPhone,
        "cus_fax": customerFax,
        "ship_name": shippingName,
        "ship_add": shippingAddress,
        "ship_city": shippingCity,
        "ship_state": shippingState,
        "ship_postcode": shippingPostCode,
        "ship_country": shippingCountry,
        "ship_phone": shippingPhone, // Add this field
      },
      token: token,
    );

    if (response.isSuccess && response.responseBody['msg'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
