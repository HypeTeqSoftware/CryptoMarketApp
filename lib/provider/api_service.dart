import 'dart:convert';

import 'package:crypto_app/api_service/api_model.dart';
import 'package:crypto_app/api_service/exception_handling.dart';
import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/constants/internet_conn.dart';
import 'package:crypto_app/models/crypto_data_model.dart';
import 'package:crypto_app/widget/show_snack_bar.dart';
import 'package:flutter/cupertino.dart';

class APIServiceProvider with ChangeNotifier {
  List<CryptoDataModel> cryptoCoinsList = [];
  bool isLoad = false;

  Future<List<CryptoDataModel>> getCryptoData() async {
    isLoad = true;
    String url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true";
    if (await InternetConnectivity.checkInternet()) {
      await APICallModel.getAPICallMethod(url).then((response) {
        if (HandlingException.checkStatusCode(response)) {
          cryptoCoinsList.addAll(List<CryptoDataModel>.from(json
              .decode(response.body)
              .map((e) => CryptoDataModel.fromJson(e))));
        } else {
          isLoad = false;
        }
      });
    } else {
      isLoad = false;
      ShowSnackBar.showSnackBar(
          text: "No Internet Connection.",
          snackBarBackgroundColor: AppColors.red);
    }
    isLoad = false;
    notifyListeners();
    return cryptoCoinsList;
  }
}
