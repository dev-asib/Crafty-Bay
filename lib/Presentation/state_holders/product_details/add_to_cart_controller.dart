import 'package:crafty_bay/data/Utils/api_urls/urls.dart';
import 'package:crafty_bay/data/entities/network/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> addToCart({
    required int productID,
    required String color,
    required String size,
    required int quantity,
  }) async {
    bool isSuccess = true;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      url: Urls.addToCartUrl,
      body: {
        "product_id": productID,
        "color": color,
        "size": size,
        "qty": quantity,
      },
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