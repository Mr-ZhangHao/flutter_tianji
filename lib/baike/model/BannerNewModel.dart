class BannerNewModel {
  String title;
  String largePicture;
  String smallPicture;
  String link;

  BannerNewModel({this.title, this.largePicture, this.smallPicture, this.link});

  BannerNewModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    largePicture = json['large_picture'];
    smallPicture = json['small_picture'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['large_picture'] = this.largePicture;
    data['small_picture'] = this.smallPicture;
    data['link'] = this.link;
    return data;
  }
}