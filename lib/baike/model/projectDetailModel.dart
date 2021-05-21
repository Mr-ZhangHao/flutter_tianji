class projectDetailModel {
  int id;
  String name;
  String logo;
  String description;
  String link;
  String download;
  int status;
  int isRecommend;
  int cateId;
  String createdAt;
  String updatedAt;
  int score;
  String level;
  Object cate;
  Levels levels;

  projectDetailModel(
      {this.id,
        this.name,
        this.logo,
        this.description,
        this.link,
        this.download,
        this.status,
        this.isRecommend,
        this.cateId,
        this.createdAt,
        this.updatedAt,
        this.score,
        this.level,
        this.cate,
        this.levels});

  projectDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    description = json['description'];
    link = json['link'];
    download = json['download'];
    status = json['status'];
    isRecommend = json['is_recommend'];
    cateId = json['cate_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    score = json['score'];
    level = json['level'];
    cate = json['cate'];
    levels =
    json['levels'] != null ? new Levels.fromJson(json['levels']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['link'] = this.link;
    data['download'] = this.download;
    data['status'] = this.status;
    data['is_recommend'] = this.isRecommend;
    data['cate_id'] = this.cateId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['score'] = this.score;
    data['level'] = this.level;
    data['cate'] = this.cate;
    if (this.levels != null) {
      data['levels'] = this.levels.toJson();
    }
    return data;
  }
}

class Levels {
  int id;
  int encyclopediaId;
  int score;
  String level;
  Descript descript;
  int status;
  String createdAt;
  String updatedAt;

  Levels(
      {this.id,
        this.encyclopediaId,
        this.score,
        this.level,
        this.descript,
        this.status,
        this.createdAt,
        this.updatedAt});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    encyclopediaId = json['encyclopedia_id'];
    score = json['score'];
    level = json['level'];
    descript = json['descript'] != null
        ? new Descript.fromJson(json['descript'])
        : null;
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['encyclopedia_id'] = this.encyclopediaId;
    data['score'] = this.score;
    data['level'] = this.level;
    if (this.descript != null) {
      data['descript'] = this.descript.toJson();
    }
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Descript {
  String score;
  List<Grade> grade;
  String level;

  Descript({this.score, this.grade, this.level});

  Descript.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    if (json['grade'] != null) {
      grade = new List<Grade>();
      json['grade'].forEach((v) {
        grade.add(new Grade.fromJson(v));
      });
    }
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    if (this.grade != null) {
      data['grade'] = this.grade.map((v) => v.toJson()).toList();
    }
    data['level'] = this.level;
    return data;
  }
}

class Grade {
  String name;
  List<Subordinate> subordinate;
  int allScore;
  int score;
  String rate;
  String level;

  Grade(
      {this.name,
        this.subordinate,
        this.allScore,
        this.score,
        this.rate,
        this.level});

  Grade.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['subordinate'] != null) {
      subordinate = new List<Subordinate>();
      json['subordinate'].forEach((v) {
        subordinate.add(new Subordinate.fromJson(v));
      });
    }
    allScore = json['allScore'];
    score = json['score'];
    rate = json['rate'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.subordinate != null) {
      data['subordinate'] = this.subordinate.map((v) => v.toJson()).toList();
    }
    data['allScore'] = this.allScore;
    data['score'] = this.score;
    data['rate'] = this.rate;
    data['level'] = this.level;
    return data;
  }
}

class Subordinate {
  String name;
  List<Grades> grade;
  int allScore;
  int score;
  String rate;

  Subordinate({this.name, this.grade, this.allScore, this.score, this.rate});

  Subordinate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['grade'] != null) {
      grade = new List<Grades>();
      json['grade'].forEach((v) {
        grade.add(new Grades.fromJson(v));
      });
    }
    allScore = json['allScore'];
    score = json['score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.grade != null) {
      data['grade'] = this.grade.map((v) => v.toJson()).toList();
    }
    data['allScore'] = this.allScore;
    data['score'] = this.score;
    data['rate'] = this.rate;
    return data;
  }
}

class Grades {
  String name;
  String content;
  int totalScore;
  int score;

  Grades({this.name, this.content, this.totalScore, this.score});

  Grades.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    content = json['content'];
    totalScore = json['totalScore'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['content'] = this.content;
    data['totalScore'] = this.totalScore;
    data['score'] = this.score;
    return data;
  }
}
