class StrategyDetailModel {
  int id;
  String platform;
  String platformImg;
  int userId;
  int platform_id;
  String avatar;
  int type;
  Object transType;
  String profitRate;
  String username;
  Object victoryRate;
  String profit;
  String balance;
  int count;
  int care;
  String create_time;
  List<String> coin;
  List<ProfitList> profitList;
  List<SumTradbuy> sumTradbuy;
  List<SumTradSell> sumTradSell;
  SumTrad sumTrad;

  StrategyDetailModel(
      {this.id,
      this.platform,
      this.platformImg,
      this.balance,
      this.userId,
      this.platform_id,
      this.avatar,
      this.type,
      this.transType,
      this.profitRate,
      this.username,
      this.victoryRate,
      this.profit,
      this.count,
      this.care,
      this.create_time,
      this.coin,
      this.profitList,
      this.sumTradbuy,
      this.sumTradSell,
      this.sumTrad});

  StrategyDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform_id = json['platform_id'];
    platform = json['platform'];
    platformImg = json['platform_img'];
    balance = json['balance'];
    userId = json['user_id'];
    avatar = json['avatar'];
    type = json['type'];
    transType = json['trans_type'];
    profitRate = json['profit_rate'];
    victoryRate = json['victory_rate'];
    profit = json['profit'];
    count = json['count'];
    coin = json['coin'].cast<String>();
    username = json['username'];
    create_time = json['create_time'];
    care = json['care'];
    if (json['profitList'] != null) {
      profitList = new List<ProfitList>();
      json['profitList'].forEach((v) {
        profitList.add(new ProfitList.fromJson(v));
      });
    }
    if (json['sumTradbuy'] != null) {
      sumTradbuy = new List<SumTradbuy>();
      json['sumTradbuy'].forEach((v) {
        sumTradbuy.add(new SumTradbuy.fromJson(v));
      });
    }
    if (json['sumTradSell'] != null) {
      sumTradSell = new List<SumTradSell>();
      json['sumTradSell'].forEach((v) {
        sumTradSell.add(new SumTradSell.fromJson(v));
      });
    }
    sumTrad =
        json['sumTrad'] != null ? new SumTrad.fromJson(json['sumTrad']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform_id'] = this.platform_id;
    data['platform'] = this.platform;
    data['balance'] = this.balance;
    data['platform_img'] = this.platformImg;
    data['user_id'] = this.userId;
    data['avatar'] = this.avatar;
    data['type'] = this.type;
    data['trans_type'] = this.transType;
    data['profit_rate'] = this.profitRate;
    data['victory_rate'] = this.victoryRate;
    data['profit'] = this.profit;
    data['count'] = this.count;
    data['coin'] = this.coin;
    data['create_time'] = this.create_time;
    data['username'] = this.username;
    data['care'] = this.care;
    if (this.profitList != null) {
      data['profitList'] = this.profitList.map((v) => v.toJson()).toList();
    }
    if (this.sumTradbuy != null) {
      data['sumTradbuy'] = this.sumTradbuy.map((v) => v.toJson()).toList();
    }
    if (this.sumTradSell != null) {
      data['sumTradSell'] = this.sumTradSell.map((v) => v.toJson()).toList();
    }
    if (this.sumTrad != null) {
      data['sumTrad'] = this.sumTrad.toJson();
    }
    return data;
  }
}

class ProfitList {
  String date;
  String year;
  String month;
  String days;
  Object pnl;

  ProfitList({this.date, this.year, this.month, this.days, this.pnl});

  ProfitList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    year = json['year'];
    month = json['month'];
    days = json['days'];
    pnl = json['pnl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['year'] = this.year;
    data['month'] = this.month;
    data['days'] = this.days;
    data['pnl'] = this.pnl;
    return data;
  }
}

class SumTradbuy {
  String date;
  String year;
  String month;
  String days;
  Object count;

  SumTradbuy({this.date, this.year, this.month, this.days, this.count});

  SumTradbuy.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    year = json['year'];
    month = json['month'];
    days = json['days'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['year'] = this.year;
    data['month'] = this.month;
    data['days'] = this.days;
    data['count'] = this.count;
    return data;
  }
}


class SumTradSell {
  String date;
  String year;
  String month;
  String days;
  Object count;

  SumTradSell({this.date, this.year, this.month, this.days, this.count});

  SumTradSell.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    year = json['year'];
    month = json['month'];
    days = json['days'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['year'] = this.year;
    data['month'] = this.month;
    data['days'] = this.days;
    data['count'] = this.count;
    return data;
  }
}


class SumTrad {
  int tradVictory;
  int tradNum;

  SumTrad({this.tradVictory, this.tradNum});

  SumTrad.fromJson(Map<String, dynamic> json) {
    tradVictory = json['tradVictory'];
    tradNum = json['tradNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tradVictory'] = this.tradVictory;
    data['tradNum'] = this.tradNum;
    return data;
  }
}
