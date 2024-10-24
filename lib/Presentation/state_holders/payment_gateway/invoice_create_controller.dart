import 'package:crafty_bay/data/Utils/api_urls/urls.dart';
import 'package:crafty_bay/data/entities/network/network_response.dart';
import 'package:crafty_bay/data/models/payment_gateway/payment_detail_model.dart';
import 'package:crafty_bay/data/models/payment_gateway/payment_gateway_list_model.dart';
import 'package:crafty_bay/data/models/payment_gateway/payment_method_categories.dart';
import 'package:crafty_bay/data/models/payment_gateway/payment_method_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class InvoiceCreateController extends GetxController {
  bool _inProgress = false;
  List<PaymentGatewayDetailModel> _paymentGatewayList = [];
  String? _errorMessage;
  PaymentMethodCategories _categorizePaymentMethods = PaymentMethodCategories(
    mobileMethods: [],
    cartMethods: [],
    internetBankMethods: [],
  );

  bool get inProgress => _inProgress;

  List<PaymentGatewayDetailModel> get paymentGatewayList => _paymentGatewayList;

  String? get errorMessage => _errorMessage;

  PaymentMethodCategories get categorizePaymentMethods =>
      _categorizePaymentMethods;

  Future<bool> getPaymentGateWay() async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.invoiceCreateUrl);

    if (response.isSuccess) {
      _errorMessage = null;
      _paymentGatewayList =
          PaymentGatewayListModel.fromJson(response.responseBody)
                  .paymentGatewayList ??
              [];

      _categorizePaymentMethods = PaymentMethodCategories(
        mobileMethods: [],
        cartMethods: [],
        internetBankMethods: [],
      );

      for (var paymentGateway in _paymentGatewayList) {
        if (paymentGateway.paymentMethodList != null) {
          _categorizePaymentMethods =
              paymentMethodsByCategory(paymentGateway.paymentMethodList!);
        }
      }

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }

  PaymentMethodCategories paymentMethodsByCategory(
      List<PaymentMethodModel> methods) {
    List<PaymentMethodModel> mobileMethods = [];
    List<PaymentMethodModel> internetBankMethods = [];
    List<PaymentMethodModel> cartMethods = [];

    for (var method in methods) {
      if (method.type == 'mobilebanking') {
        mobileMethods.add(method);
      } else if (method.type == 'internetbanking') {
        internetBankMethods.add(method);
      } else {
        cartMethods.add(method);
      }
    }

    return PaymentMethodCategories(
      mobileMethods: mobileMethods,
      cartMethods: cartMethods,
      internetBankMethods: internetBankMethods,
    );
  }
}
