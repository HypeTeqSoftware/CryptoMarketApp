class CryptoDataModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  var currentPrice;
  var marketCap;
  var marketCapRank;
  var totalVolume;
  var high24h;
  var low24h;
  double? priceChange24h;
  double? marketCapChangePercentage24h;
  SparklineIn7d? sparklineIn7d;

  CryptoDataModel(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.marketCap,
      this.marketCapRank,
      this.totalVolume,
      this.high24h,
      this.low24h,
      this.priceChange24h,
      this.sparklineIn7d});

  CryptoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = json['current_price'];
    marketCap = json['market_cap'];
    marketCapRank = json['market_cap_rank'];
    totalVolume = json['total_volume'];
    high24h = json['high_24h'];
    low24h = json['low_24h'];
    priceChange24h = json['price_change_24h'];
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    sparklineIn7d = json['sparkline_in_7d'] != null
        ? SparklineIn7d.fromJson(json['sparkline_in_7d'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['image'] = image;
    data['current_price'] = currentPrice;
    data['market_cap'] = marketCap;
    data['market_cap_rank'] = marketCapRank;
    data['total_volume'] = totalVolume;
    data['high_24h'] = high24h;
    data['low_24h'] = low24h;
    data['price_change_24h'] = priceChange24h;
    data['market_cap_change_percentage_24h'] = marketCapChangePercentage24h;
    if (sparklineIn7d != null) {
      data['sparkline_in_7d'] = sparklineIn7d!.toJson();
    }
    return data;
  }
}

class SparklineIn7d {
  List<double>? price;

  SparklineIn7d({this.price});

  SparklineIn7d.fromJson(Map<String, dynamic> json) {
    price = json['price'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    return data;
  }
}
