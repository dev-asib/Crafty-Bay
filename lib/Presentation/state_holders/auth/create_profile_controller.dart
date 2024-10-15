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
    required String firstName,
    required String lastName,
    required String mobile,
    required String city,
    required String shippingAddress,
    required String token,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      url: Urls.createProfileUrl,
      body: {
        "cus_name": "$firstName $lastName",
        "cus_add": "West Seowta, Manikganj",
        "cus_city": city,
        "cus_state": "Manikganj",
        "cus_postcode": "1800",
        "cus_country": "Bangladesh",
        "cus_phone": mobile,
        "cus_fax": "01711111111",
        "ship_name": "Asib",
        "ship_add": shippingAddress,
        "ship_city": "Manikganj",
        "ship_state": "Manikganj",
        "ship_postcode": "1800",
        "ship_country": "Bangladesh",
        "ship_phone": "01711111111", // Add this field
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
