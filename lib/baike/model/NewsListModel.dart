class NewsListModel {
  int id;
  String name;
  List<Journalism> journalism;

  NewsListModel({this.id, this.name, this.journalism});

  NewsListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['journalism'] != null) {
      journalism = new List<Journalism>();
      json['journalism'].forEach((v) {
        journalism.add(new Journalism.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.journalism != null) {
      data['journalism'] = this.journalism.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Journalism {
  int id;
  int cateId;
  String title;
  String sources;
  int isForward;
  String images;
  String descript;
  String tag;
  int status;
  String updatedAt;
  String createdAt;
  Log log;
  int praiseNum;

  Journalism(
      {this.id,
        this.cateId,
        this.title,
        this.sources,
        this.isForward,
        this.images,
        this.descript,
        this.tag,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.log,
        this.praiseNum});

  Journalism.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cateId = json['cate_id'];
    title = json['title'];
    sources = json['sources'];
    isForward = json['is_forward'];
    images = json['images'];
    descript = json['descript'];
    tag = json['tag'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    log = json['log'] != null ? new Log.fromJson(json['log']) : null;
    praiseNum = json['praise_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cate_id'] = this.cateId;
    data['title'] = this.title;
    data['sources'] = this.sources;
    data['is_forward'] = this.isForward;
    data['images'] = this.images;
    data['descript'] = this.descript;
    data['tag'] = this.tag;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    if (this.log != null) {
      data['log'] = this.log.toJson();
    }
    data['praise_num'] = this.praiseNum;
    return data;
  }
}

class Log {
  String username;
  int time;

  Log({this.username, this.time});

  Log.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['time'] = this.time;
    return data;
  }
}
