class StandardModel {
  int code;
  String message;
  Data data;

  StandardModel({this.code, this.message, this.data});

  StandardModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Withdraw> withdraw;

  Data({this.withdraw});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['withdraw'] != null) {
      withdraw = new List<Withdraw>();
      json['withdraw'].forEach((v) {
        withdraw.add(new Withdraw.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.withdraw != null) {
      data['withdraw'] = this.withdraw.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Withdraw {
  String name;
  String tip;
  Object fee;
  Object min;
  Object singleMax;
  Object dayMax;

  Withdraw(
      {this.name, this.tip, this.fee, this.min, this.singleMax, this.dayMax});

  Withdraw.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tip = json['tip'];
    fee = json['fee'];
    min = json['min'];
    singleMax = json['single_max'];
    dayMax = json['day_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tip'] = this.tip;
    data['fee'] = this.fee;
    data['min'] = this.min;
    data['single_max'] = this.singleMax;
    data['day_max'] = this.dayMax;
    return data;
  }
}
