class rankingModel {
  int userId;
  String username;
  Object avatar;
  Object profit;
  String rate;
  Object totalProfit;

  rankingModel(
      {this.userId,
        this.username,
        this.avatar,
        this.profit,
        this.rate,
        this.totalProfit});

  rankingModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    avatar = json['avatar'];
    profit = json['profit'];
    rate = json['rate'];
    totalProfit = json['totalProfit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['profit'] = this.profit;
    data['rate'] = this.rate;
    data['totalProfit'] = this.totalProfit;
    return data;
  }
}