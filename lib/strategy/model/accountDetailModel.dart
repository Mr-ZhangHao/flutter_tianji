class accountDetailModel {
  int id;
  String platform;
  String platformImg;
  int userId;
  Object username;
  Object avatar;
  int type;
  String typeName;
  Object transType;
  String balance;
  String memo;
  String coin;
  String createTime;
  int follow;
  Object profitRate;
  String profit;
  String commission;

  accountDetailModel(
      {this.id,
      this.platform,
      this.platformImg,
      this.memo,
      this.userId,
      this.username,
      this.avatar,
      this.type,
      this.typeName,
      this.transType,
      this.balance,
      this.coin,
      this.createTime,
      this.follow,
      this.profitRate,
      this.profit,
      this.commission});

  accountDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    platformImg = json['platform_img'];
    memo = json['memo'];
    userId = json['user_id'];
    username = json['username'];
    avatar = json['avatar'];
    type = json['type'];
    typeName = json['type_name'];
    transType = json['trans_type'];
    balance = json['balance'];
    coin = json['coin'];
    createTime = json['create_time'];
    follow = json['follow'];
    profitRate = json['profit_rate'];
    profit = json['profit'];
    commission = json['commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform'] = this.platform;
    data['memo'] = this.memo;
    data['platform_img'] = this.platformImg;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['type'] = this.type;
    data['type_name'] = this.typeName;
    data['trans_type'] = this.transType;
    data['balance'] = this.balance;
    data['coin'] = this.coin;
    data['create_time'] = this.createTime;
    data['follow'] = this.follow;
    data['profit_rate'] = this.profitRate;
    data['profit'] = this.profit;
    data['commission'] = this.commission;
    return data;
  }
}
