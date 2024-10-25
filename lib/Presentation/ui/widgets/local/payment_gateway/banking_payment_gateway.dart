import 'package:crafty_bay/Presentation/state_holders/payment_gateway/invoice_create_controller.dart';
import 'package:crafty_bay/Presentation/ui/widgets/local/payment_gateway/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankingPaymentGatewayView extends StatelessWidget {
  const BankingPaymentGatewayView({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentMethods = Get.find<InvoiceCreateController>()
        .categorizePaymentMethods
        .internetBankMethods;
    return PaymentMethods(paymentMethods: paymentMethods);
  }
}