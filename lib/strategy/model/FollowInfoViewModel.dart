class FollowInfoViewModel {
  String coin;
  Object proportion;
  int status;

  FollowInfoViewModel({this.coin, this.proportion, this.status});

  FollowInfoViewModel.fromJson(Map<String, dynamic> json) {
    coin = json['coin'];
    proportion = json['proportion'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this.coin;
    data['proportion'] = this.proportion;
    data['status'] = this.status;
    return data;
  }
}
