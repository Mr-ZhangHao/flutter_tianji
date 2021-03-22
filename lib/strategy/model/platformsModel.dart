class platformsModel {
  int id;
  String platform;
  String img;

  platformsModel({this.id, this.platform, this.img});

  platformsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform'] = this.platform;
    data['img'] = this.img;
    return data;
  }
}
