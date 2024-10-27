import 'package:crafty_bay/Presentation/state_holders/payment_gateway/payment_method_list_controller.dart';
import 'package:crafty_bay/Presentation/ui/widgets/local/payment_gateway/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileBankingPaymentGateway extends StatelessWidget {
  const MobileBankingPaymentGateway({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentMethods = Get.find<PaymentMethodListController>()
        .categorizePaymentMethods
        .mobileMethods;
    return PaymentMethods(paymentMethods: paymentMethods);
  }
}
