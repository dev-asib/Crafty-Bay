import 'package:crafty_bay/Presentation/state_holders/payment_gateway/invoice_create_controller.dart';
import 'package:crafty_bay/Presentation/ui/utils/colors/app_colors.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:crafty_bay/data/models/payment_gateway/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
    required this.paymentMethods,
  });

  final List<PaymentMethodModel> paymentMethods;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceCreateController>(
        builder: (invoiceCreateController) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RoutesName.paymentGatewayWebViewScreen, arguments: {
                "gatewayUrl": paymentMethods[index].redirectGatewayURL,
              });
            },
            child: Card(
              color: AppColors.whiteColor,
              elevation: 4,
              child: Image.network(
                fit: BoxFit.fill,
                paymentMethods[index].logo ?? '',
                errorBuilder: (context, child, stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 40,
                    color: AppColors.themeColor,
                  );
                },
              ),
            ),
          );
        },
      );
    });
  }
}
