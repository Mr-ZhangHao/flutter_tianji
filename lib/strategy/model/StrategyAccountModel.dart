class StrategyAccountModel {
  int id;
  Object platform;
  int userId;
  Object username;
  Object avatar;
  int type;
  String typeName;
  Object transType;
  String balance;
  String coin;
  Object count;
  Object profit;
  Object platform_img;
  Object memo;

  StrategyAccountModel({
    this.id,
    this.platform,
    this.userId,
    this.username,
    this.avatar,
    this.type,
    this.typeName,
    this.transType,
    this.balance,
    this.coin,
    this.count,
    this.profit,
    this.platform_img,
    this.memo,
  });

  StrategyAccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    userId = json['user_id'];
    username = json['username'];
    avatar = json['avatar'];
    type = json['type'];
    typeName = json['type_name'];
    transType = json['trans_type'];
    balance = json['balance'];
    coin = json['coin'];
    count = json['count'];
    profit = json['profit'];
    platform_img = json['platform_img'];
    memo = json['memo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform'] = this.platform;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['type'] = this.type;
    data['type_name'] = this.typeName;
    data['trans_type'] = this.transType;
    data['balance'] = this.balance;
    data['coin'] = this.coin;
    data['count'] = this.count;
    data['profit'] = this.profit;
    data['platform_img'] = this.platform_img;
    data['memo'] = this.memo;
    return data;
  }
}
