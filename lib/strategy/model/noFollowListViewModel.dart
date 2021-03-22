class noFollowListViewModel {
  int id;
  String platform;
  String platformImg;
  int userId;
  String username;
  String avatar;
  String memo;
  int count;

  noFollowListViewModel(
      {this.id,
      this.platform,
      this.platformImg,
      this.userId,
      this.username,
      this.avatar,
      this.memo,
      this.count});

  noFollowListViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    platformImg = json['platform_img'];
    userId = json['user_id'];
    username = json['username'];
    avatar = json['avatar'];
    memo = json['memo'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform'] = this.platform;
    data['platform_img'] = this.platformImg;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['memo'] = this.memo;
    data['count'] = this.count;
    return data;
  }
}
