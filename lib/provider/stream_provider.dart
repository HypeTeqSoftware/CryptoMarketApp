import 'package:crypto_app/models/crypto_data_model.dart';
import 'package:crypto_app/provider/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StreamsProvider with ChangeNotifier {
  Stream<List<CryptoDataModel>> cryptoDataStream(context) async* {
    List<CryptoDataModel> list = [];
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      list = await Provider.of<APIServiceProvider>(context, listen: false)
          .getCryptoData();
      notifyListeners();
      yield list;
    }
  }
}
