import 'package:crafty_bay/data/models/payment_gateway/payment_method_model.dart';

class PaymentGatewayDetailModel {
  List<PaymentMethodModel>? paymentMethodList;
  int? payable;
  int? vat;
  int? total;

  PaymentGatewayDetailModel(
      {this.paymentMethodList, this.payable, this.vat, this.total});

  PaymentGatewayDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethodList = <PaymentMethodModel>[];
      json['paymentMethod'].forEach((v) {
        paymentMethodList!.add(PaymentMethodModel.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }
}