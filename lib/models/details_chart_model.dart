class CoinDetailChartModel {
  int? time;
  double? open;
  double? high;
  double? low;
  double? close;

  CoinDetailChartModel(
      {required this.time, this.open, this.high, this.low, this.close});

  factory CoinDetailChartModel.fromJson(List list) {
    return CoinDetailChartModel(
        time: list[0],
        open: list[1],
        high: list[2],
        low: list[3],
        close: list[4]);
  }
}

class ChartBottomModel {
  String text;
  bool isClick;

  ChartBottomModel({required this.text, required this.isClick});
}
