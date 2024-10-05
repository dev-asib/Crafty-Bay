import 'package:crafty_bay/data/Utils/urls.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  ProductDetailsModel? _productDetailsModel;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  ProductDetailsModel? get productDetailsModel => _productDetailsModel;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetailsById(int id) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productDetailsByIdUrl(id));

    if (response.isSuccess) {
      _errorMessage = null;
      _productDetailsModel =
          ProductDetailsModel.fromJson(response.responseBody['data'][0]);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}

