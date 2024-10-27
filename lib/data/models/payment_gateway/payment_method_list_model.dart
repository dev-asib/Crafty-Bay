import 'package:crafty_bay/data/models/payment_gateway/payment_method_response_data_model.dart';

class PaymentMethodListModel {
  String? msg;
  List<PaymentMethodResponseDataModel>? paymentMethodList;

  PaymentMethodListModel({this.msg, this.paymentMethodList});

  PaymentMethodListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      paymentMethodList = <PaymentMethodResponseDataModel>[];
      json['data'].forEach((v) {
        paymentMethodList!.add(PaymentMethodResponseDataModel.fromJson(v));
      });
    }
  }
}



