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
        "cus_add": "Adabor,Dhaka",
        "cus_city": "Dhaka",
        "cus_state": "Dhaka",
        "cus_postcode": "1200",
        "cus_country": "Bangladesh",
        "cus_phone": mobile,
        "cus_fax": "01711111111",
        "ship_name": "Rabbil Hasan",
        "ship_add": shippingAddress,
        "ship_city": city,
        "ship_state": "Dhaka",
        "ship_postcode": "1200",
        "ship_country": "Bangladesh"
      },
      token: token,
    );

    if (response.isSuccess && response.responseBody['msg'] == 'success' && response.responseBody['data'] != null) {
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
