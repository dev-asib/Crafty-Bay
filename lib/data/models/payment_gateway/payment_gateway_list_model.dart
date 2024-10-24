import 'package:crafty_bay/data/models/payment_gateway/payment_detail_model.dart';

class PaymentGatewayListModel {
  String? msg;
  List<PaymentGatewayDetailModel>? paymentGatewayList;

  PaymentGatewayListModel({this.msg, this.paymentGatewayList});

  PaymentGatewayListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      paymentGatewayList = <PaymentGatewayDetailModel>[];
      json['data'].forEach((v) {
        paymentGatewayList!.add(PaymentGatewayDetailModel.fromJson(v));
      });
    }
  }
}



