import 'package:crafty_bay/data/Utils/urls.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  String _accessToken = '';

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  String get accessToken => _accessToken;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = true;

    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.verifyOtpUrl(email, otp),
    );

    _inProgress = false;
    update();

    if (response.isSuccess && response.responseBody['msg'] == 'success') {
      isSuccess = true;
      _accessToken = response.responseBody['data'];
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    return isSuccess;
  }
}
