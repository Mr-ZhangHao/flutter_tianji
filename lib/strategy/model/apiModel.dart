class apiModel {
  int id;
  int platform;
  String accesskey;
  String secretKey;
  String passphrase;
  int type;
  String createTime;
  int term;
  Object transType;
  int userId;
  String memo;
  String updateTime;
  int status;
  String coin;
  Object accountId;
  String balance;

  apiModel(
      {this.id,
      this.platform,
      this.accesskey,
      this.secretKey,
      this.passphrase,
      this.type,
      this.createTime,
      this.term,
      this.transType,
      this.userId,
      this.memo,
      this.updateTime,
      this.status,
      this.coin,
      this.accountId,
      this.balance});

  apiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    accesskey = json['accesskey'];
    secretKey = json['secretKey'];
    passphrase = json['passphrase'];
    type = json['type'];
    createTime = json['create_time'];
    term = json['term'];
    transType = json['trans_type'];
    userId = json['user_id'];
    memo = json['memo'];
    updateTime = json['update_time'];
    status = json['status'];
    coin = json['coin'];
    accountId = json['account_id'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform'] = this.platform;
    data['accesskey'] = this.accesskey;
    data['secretKey'] = this.secretKey;
    data['passphrase'] = this.passphrase;
    data['type'] = this.type;
    data['create_time'] = this.createTime;
    data['term'] = this.term;
    data['trans_type'] = this.transType;
    data['user_id'] = this.userId;
    data['memo'] = this.memo;
    data['update_time'] = this.updateTime;
    data['status'] = this.status;
    data['coin'] = this.coin;
    data['account_id'] = this.accountId;
    data['balance'] = this.balance;
    return data;
  }
}
