class genSuiListViewModel {
  int apiId;
  int followApiId;
  String platform;
  String followUsername;
  String followAvatar;
  String coin;
  String profit;
  int size;
  int count;
  Object fee;
  Object time;
  String username;
  Object avatar;
  String proportion;
  String createTime;

  genSuiListViewModel(
      {this.apiId,
      this.followApiId,
      this.platform,
      this.followUsername,
      this.followAvatar,
      this.coin,
      this.profit,
      this.size,
      this.count,
      this.fee,
      this.time,
      this.username,
      this.avatar,
      this.proportion,
      this.createTime});

  genSuiListViewModel.fromJson(Map<String, dynamic> json) {
    apiId = json['api_id'];
    followApiId = json['follow_api_id'];
    platform = json['platform'];
    followUsername = json['follow_username'];
    followAvatar = json['follow_avatar'];
    coin = json['coin'];
    profit = json['profit'];
    size = json['size'];
    count = json['count'];
    fee = json['fee'];
    time = json['time'];
    username = json['username'];
    avatar = json['avatar'];
    proportion = json['proportion'];
    createTime = json['create_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_id'] = this.apiId;
    data['follow_api_id'] = this.followApiId;
    data['platform'] = this.platform;
    data['follow_username'] = this.followUsername;
    data['follow_avatar'] = this.followAvatar;
    data['coin'] = this.coin;
    data['profit'] = this.profit;
    data['size'] = this.size;
    data['count'] = this.count;
    data['fee'] = this.fee;
    data['time'] = this.time;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['proportion'] = this.proportion;
    data['create_time'] = this.createTime;
    return data;
  }
}
