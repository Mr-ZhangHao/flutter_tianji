class myInterestListModel {
  int id;
  String platform;
  String platformImg;
  int userId;
  String username;
  Object avatar;
  String coin;

  myInterestListModel(
      {this.id,
      this.platform,
      this.platformImg,
      this.userId,
      this.username,
      this.avatar,
      this.coin});

  myInterestListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    platformImg = json['platform_img'];
    userId = json['user_id'];
    username = json['username'];
    avatar = json['avatar'];
    coin = json['coin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform'] = this.platform;
    data['platform_img'] = this.platformImg;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['coin'] = this.coin;
    return data;
  }
}
