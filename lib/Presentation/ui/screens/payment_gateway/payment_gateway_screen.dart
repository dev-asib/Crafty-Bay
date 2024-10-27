import 'package:crafty_bay/Presentation/state_holders/payment_gateway/payment_method_list_controller.dart';
import 'package:crafty_bay/Presentation/ui/utils/colors/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/widgets/local/payment_gateway/internet_banking_payment_gateway.dart';
import 'package:crafty_bay/Presentation/ui/widgets/local/payment_gateway/card_payment_gateway_view.dart';
import 'package:crafty_bay/Presentation/ui/widgets/local/payment_gateway/mobile_banking_payment_gateway_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PaymentMethodListController>().getPaymentMethod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              MobileBankingPaymentGateway(),
              InternetBankingPaymentGatewayView(),
              CardPaymentGatewayView(),
            ],
          ),
        ),
        bottomNavigationBar: _buildPaymentSummary(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      automaticallyImplyLeading: false,
      title: const Text("Payment Method"),
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(text: "MFS"),
        Tab(text: "IBS"),
        Tab(text: "Card"),
      ],
    );
  }

  Widget _buildPaymentSummary() {
    return GetBuilder<PaymentMethodListController>(
        builder: (paymentMethodListController) {
      final TextTheme textTheme = Theme.of(context).textTheme;
      return Container(
        height: 56,
        decoration: const BoxDecoration(
          color: AppColors.themeColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total: \$${paymentMethodListController.paymentGatewayList?.total ?? '0'}",
                    style: textTheme.titleMedium
                        ?.copyWith(color: AppColors.whiteColor),
                  ),
                  Text(
                    "Vat: \$${paymentMethodListController.paymentGatewayList?.vat ?? '0'}",
                    style: textTheme.titleMedium
                        ?.copyWith(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
            Text(
              "(Pay \$${paymentMethodListController.paymentGatewayList?.payable ?? '0'})",
              style:
                  textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),
            ),
            const Center(
              child: Icon(
                Icons.shopping_cart_checkout_outlined,
                size: 35,
                color: AppColors.whiteColor,
              ),
            )
          ],
        ),
      );
    });
  }
}
