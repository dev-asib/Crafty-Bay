import 'package:crafty_bay/Presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/data/Utils/urls.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  bool _isProfileCompleted = false;
  ProductDetailsModel? _productDetailsModel;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  bool get isProfileCompleted => _isProfileCompleted;

  ProductDetailsModel? get productDetailsModel => _productDetailsModel;

  String? get errorMessage => _errorMessage;

  Future<bool> getProfileDetails(String token) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.readProfileUrl,
      token: token,
    );

    if (response.isSuccess) {
      if (response.responseBody['data'] != null) {
        _isProfileCompleted = true;
        await Get.find<AuthController>().saveAccessToken(token);
      }
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
