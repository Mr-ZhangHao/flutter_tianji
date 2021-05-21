class projectListModel {
  int id;
  String name;
  String cateName;
  String level;
  Object score;
  String createdAt;
  String status;
  int isRecommend;
  int collect;
  Object rate;
  Object description;

  projectListModel(
      {this.id,
        this.name,
        this.cateName,
        this.level,
        this.score,
        this.createdAt,
        this.status,
        this.isRecommend,
        this.description,
        this.collect,
        this.rate});

  projectListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cateName = json['cate_name'];
    level = json['level'];
    score = json['score'];
    createdAt = json['created_at'];
    status = json['status'];
    isRecommend = json['is_recommend'];
    description = json['description'];
    collect = json['collect'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cate_name'] = this.cateName;
    data['level'] = this.level;
    data['score'] = this.score;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['is_recommend'] = this.isRecommend;
    data['description'] = this.description;
    data['collect'] = this.collect;
    data['rate'] = this.rate;
    return data;
  }
}
