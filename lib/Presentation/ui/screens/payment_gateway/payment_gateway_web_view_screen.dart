import 'package:crafty_bay/Presentation/ui/utils/assets_paths/assets_paths.dart';
import 'package:crafty_bay/Presentation/ui/widgets/global/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentGatewayWebViewScreen extends StatefulWidget {
  const PaymentGatewayWebViewScreen({super.key});

  @override
  State<PaymentGatewayWebViewScreen> createState() =>
      _PaymentGatewayWebViewScreenState();
}

class _PaymentGatewayWebViewScreenState
    extends State<PaymentGatewayWebViewScreen> {
  WebViewController? _gateWayWebViewController;

  WebViewController _webViewController() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},

          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            debugPrint(request.url);
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(Get.arguments['gatewayUrl']));
  }

  @override
  void initState() {
    super.initState();
    _gateWayWebViewController = _webViewController();
  }

  @override
  Widget build(BuildContext context) {
    final gatewayUrl = Get.arguments['gatewayUrl'];
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: gatewayUrl != null && gatewayUrl.isNotEmpty
            ? WebViewWidget(
                controller: _gateWayWebViewController!,
              )
            : const EmptyWidget(
                imagePath: AssetsPaths.paymentGatewayUnavailable,
                message:
                    'Selected payment method is currently unavailable. Please try another method.',
              ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: ()=> Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      automaticallyImplyLeading: false,
      title: const Text("Payment"),
    );
  }
}
