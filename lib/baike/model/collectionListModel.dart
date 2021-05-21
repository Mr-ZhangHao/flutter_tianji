class collectionListModel {
  int id;
  int encyclopedia;
  String encyclopediaName;
  Object encyclopediaLogo;
  String cateName;
  String level;
  int collect;
  Object rate;
  String createdTime;

  collectionListModel(
      {this.id,
        this.encyclopedia,
        this.encyclopediaName,
        this.encyclopediaLogo,
        this.cateName,
        this.level,
        this.collect,
        this.rate,
        this.createdTime});

  collectionListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    encyclopedia = json['encyclopedia'];
    encyclopediaName = json['encyclopediaName'];
    encyclopediaLogo = json['encyclopediaLogo'];
    cateName = json['cateName'];
    level = json['level'];
    collect = json['collect'];
    rate = json['rate'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['encyclopedia'] = this.encyclopedia;
    data['encyclopediaName'] = this.encyclopediaName;
    data['encyclopediaLogo'] = this.encyclopediaLogo;
    data['cateName'] = this.cateName;
    data['level'] = this.level;
    data['collect'] = this.collect;
    data['rate'] = this.rate;
    data['created_time'] = this.createdTime;
    return data;
  }
}