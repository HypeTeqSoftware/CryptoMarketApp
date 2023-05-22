import 'dart:convert';

import 'package:crypto_app/api_service/api_model.dart';
import 'package:crypto_app/models/details_chart_model.dart';
import 'package:flutter/widgets.dart';

class ChartsProvider with ChangeNotifier {
  List<CoinDetailChartModel> coinDetailsChartList = [];
  String enDescCoin = "";

  List<ChartBottomModel> list = [
    ChartBottomModel(text: "D", isClick: false),
    ChartBottomModel(text: "W", isClick: false),
    ChartBottomModel(text: "M", isClick: true),
    ChartBottomModel(text: "3M", isClick: false),
    ChartBottomModel(text: "6M", isClick: false),
    ChartBottomModel(text: "Y", isClick: false),
  ];
  bool isLoadChart = false, isLoadCoin = false;
  int day = 30;

  Future getChartDetails(id) async {
    try {
      isLoadChart = true;
      await APICallModel.getAPICallMethod(
              "https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$day")
          .then((response) {
        if (response.statusCode == 200) {
          Iterable i = json.decode(response.body);
          List<CoinDetailChartModel> l =
              i.map((e) => CoinDetailChartModel.fromJson(e)).toList();
          coinDetailsChartList = l;
        }
      });
    } catch (e) {
      isLoadChart = false;
      print(e.toString());
    }
    isLoadChart = false;
    notifyListeners();
    return coinDetailsChartList;
  }

  changeBool(index) {
    list.map((e) => e.isClick = false).toList();
    list[index].isClick = true;
    notifyListeners();
  }

  setDays(text) {
    if (text == list[0].text) {
      day = 1;
    } else if (text == list[1].text) {
      day = 7;
    } else if (text == list[2].text) {
      day = 30;
    } else if (text == list[3].text) {
      day = 90;
    } else if (text == list[4].text) {
      day = 180;
    } else if (text == list[5].text) {
      day = 365;
    }
    notifyListeners();
  }

  Future getCoinDetails(id) async {
    try {
      isLoadCoin = true;
      await APICallModel.getAPICallMethod(
              "https://api.coingecko.com/api/v3/coins/$id")
          .then((response) {
        if (response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          enDescCoin = jsonResponse['description']['en'];
        }
      });
    } catch (e) {
      isLoadCoin = false;
      print(e.toString());
    }
    isLoadCoin = false;
    notifyListeners();
  }
}
