class ongoingListViewModel {
  String orderId;
  int type;
  String size;
  String price;
  String priceAvg;
  String filledQty;
  String fee;
  String timestamp;
  String pnl;
  String contractVal;
  String instrument_id;
  String side;
  int leverage;
  int orderType;
  int state;

  ongoingListViewModel(
      {this.orderId,
      this.type,
      this.size,
      this.price,
      this.priceAvg,
      this.side,
      this.filledQty,
      this.fee,
      this.timestamp,
      this.pnl,
      this.contractVal,
      this.leverage,
      this.orderType,
      this.instrument_id,
      this.state});

  ongoingListViewModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    type = json['type'];
    side = json['side'];
    size = json['size'];
    price = json['price'];
    priceAvg = json['price_avg'];
    filledQty = json['filled_qty'];
    fee = json['fee'];
    timestamp = json['timestamp'];
    pnl = json['pnl'];
    contractVal = json['contract_val'];
    leverage = json['leverage'];
    orderType = json['order_type'];
    state = json['state'];
    instrument_id = json['instrument_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['type'] = this.type;
    data['side'] = this.side;
    data['size'] = this.size;
    data['price'] = this.price;
    data['price_avg'] = this.priceAvg;
    data['filled_qty'] = this.filledQty;
    data['fee'] = this.fee;
    data['timestamp'] = this.timestamp;
    data['pnl'] = this.pnl;
    data['contract_val'] = this.contractVal;
    data['leverage'] = this.leverage;
    data['order_type'] = this.orderType;
    data['state'] = this.state;
    data['instrument_id'] = this.instrument_id;
    return data;
  }
}
