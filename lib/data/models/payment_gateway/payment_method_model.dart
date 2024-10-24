class PaymentMethodModel {
  String? name;
  String? type;
  String? logo;
  String? gw;
  String? rFlag;
  String? redirectGatewayURL;

  PaymentMethodModel(
      {this.name,
        this.type,
        this.logo,
        this.gw,
        this.rFlag,
        this.redirectGatewayURL});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
    gw = json['gw'];
    rFlag = json['r_flag'];
    redirectGatewayURL = json['redirectGatewayURL'];
  }
}
