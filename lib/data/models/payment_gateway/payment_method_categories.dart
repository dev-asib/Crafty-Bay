import 'package:crafty_bay/data/models/payment_gateway/payment_method_model.dart';

class PaymentMethodCategories {
  List<PaymentMethodModel> mobileMethods;
  List<PaymentMethodModel> cartMethods;
  List<PaymentMethodModel> internetBankMethods;

  PaymentMethodCategories({
    required this.mobileMethods,
    required this.cartMethods,
    required this.internetBankMethods,
  });
}
