class screenTypeModel {
  List<Cate> cate;
  List<String> level;

  screenTypeModel({this.cate, this.level});

  screenTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['cate'] != null) {
      cate = new List<Cate>();
      json['cate'].forEach((v) {
        cate.add(new Cate.fromJson(v));
      });
    }
    level = json['level'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cate != null) {
      data['cate'] = this.cate.map((v) => v.toJson()).toList();
    }
    data['level'] = this.level;
    return data;
  }
}

class Cate {
  int id;
  String name;

  Cate({this.id, this.name});

  Cate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}