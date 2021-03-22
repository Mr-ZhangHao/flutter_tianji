class StrategyTypeModel {
  int id;
  String typeName;

  StrategyTypeModel({this.id, this.typeName});

  StrategyTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_name'] = this.typeName;
    return data;
  }
}
