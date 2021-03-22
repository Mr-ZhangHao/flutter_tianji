class strategyListModel {
  int id;
  String platform;
  String platformImg;
  int platformId;
  int userId;
  String avatar;
  String username;
  int type;
  int is_recommend;
  Object transType;
  String profitRate;
  Object victoryRate;
  String profit;
  int count;
  int care;
  String create_time;
  String coin;
  List<ProfitList> profitList;
  List<SumTradbuy> sumTradbuy;
  List<SumTradSell> sumTradSell;
  SumTrad sumTrad;

  strategyListModel(
      {this.id,
      this.platform,
      this.platformId,
      this.is_recommend,
      this.platformImg,
      this.userId,
      this.username,
      this.avatar,
      this.type,
      this.transType,
      this.profitRate,
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

  strategyListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    platformId = json['platform_id'];
    is_recommend = json['is_recommend'];
    platformImg = json['platform_img'];
    userId = json['user_id'];
    username = json['username'];
    avatar = json['avatar'];
    type = json['type'];
    transType = json['trans_type'];
    profitRate = json['profit_rate'];
    victoryRate = json['victory_rate'];
    profit = json['profit'];
    count = json['count'];
    coin = json['coin'];
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
    data['platform'] = this.platform;
    data['platform_id'] = this.platformId;
    data['platform_img'] = this.platformImg;
    data['is_recommend'] = this.is_recommend;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['type'] = this.type;
    data['trans_type'] = this.transType;
    data['profit_rate'] = this.profitRate;
    data['victory_rate'] = this.victoryRate;
    data['profit'] = this.profit;
    data['count'] = this.count;
    data['coin'] = this.coin;
    data['create_time'] = this.create_time;
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
  String pnl;

  ProfitList({this.date, this.pnl});

  ProfitList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    pnl = json['pnl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['pnl'] = this.pnl;
    return data;
  }
}

class SumTradbuy {
  String date;
  int count;

  SumTradbuy({this.date, this.count});

  SumTradbuy.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['count'] = this.count;
    return data;
  }
}

class SumTradSell {
  String date;
  int count;

  SumTradSell({this.date, this.count});

  SumTradSell.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
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
