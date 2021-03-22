class CoinsModel {
  int id;
  String coin;

  CoinsModel({this.id, this.coin});

  CoinsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coin = json['coin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coin'] = this.coin;
    return data;
  }
}
