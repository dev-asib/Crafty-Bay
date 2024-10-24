import 'package:crafty_bay/Presentation/state_holders/payment_gateway/invoice_create_controller.dart';
import 'package:crafty_bay/Presentation/ui/utils/colors/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/widgets/global/app_logo_widget.dart';
import 'package:crafty_bay/Presentation/ui/widgets/local/payment_gateway/banking_payment_gateway.dart';
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
      Get.find<InvoiceCreateController>().getPaymentGateWay();
    });
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const AppLogoWidget(),
                  const SizedBox(height: 8),
                  Text("Make your payment",
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 24),
                  const Expanded(
                    child: Column(
                      children: [
                        TabBar(
                          //  isScrollable: true,
                          tabs: [
                            Tab(text: "MFS"),
                            Tab(text: "Bank"),
                            Tab(text: "Card"),
                          ],
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: TabBarView(
                            children: [
                              MobileBankingPaymentGateway(),
                              BankingPaymentGatewayView(),
                              CardPaymentGatewayView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _servePayment(),
      ),
    );
  }

  Widget _servePayment() {
    return GetBuilder<InvoiceCreateController>(
      builder: (invoiceCreateController) {
        return Container(
          height: 56,
          decoration: const BoxDecoration(
            color: AppColors.themeColor,
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pay \$${Get.arguments['totalPrice']}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(width: 20),
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
      }
    );
  }
}
