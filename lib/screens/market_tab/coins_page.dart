import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_app/constants/app_images.dart';
import 'package:crypto_app/models/crypto_data_model.dart';
import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/constants/app_strings.dart';
import 'package:crypto_app/provider/api_service.dart';
import 'package:crypto_app/screens/market_tab/coin_details.dart';
import 'package:crypto_app/widget/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({Key? key}) : super(key: key);

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Padding(
          padding:const EdgeInsets.only(left: 14.0),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.user))
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(
          AppString.market,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: FutureBuilder<List<CryptoDataModel>>(
            future: Provider.of<APIServiceProvider>(context, listen: false)
                .getCryptoData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Loader();
              } else {
                return snapshot.data!.isEmpty
                    ? const Center(
                        child: Text("Check your internet connection."),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18.0, bottom: 18.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CoinDetailsScreen(
                                                selectedCoin:
                                                    snapshot.data![index],
                                              ))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 21,
                                            backgroundColor: AppColors.white,
                                            backgroundImage: NetworkImage(
                                                snapshot.data![index].image
                                                    .toString()),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  snapshot.data![index].name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.5),
                                                ),
                                              ),
                                              Text(
                                                  "0.4 ${snapshot.data![index].symbol}")
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 100,
                                        height: 60,
                                        child: Sparkline(
                                          data: snapshot.data![index]
                                              .sparklineIn7d!.price!,
                                          lineWidth: 2.0,
                                          lineColor: AppColors.primary400,
                                          fillMode: FillMode.below,
                                          fillGradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: const [0.0, 0.7],
                                              colors: snapshot.data![index]
                                                          .marketCapChangePercentage24h! >=
                                                      0
                                                  ? [
                                                      AppColors.green,
                                                      AppColors.green.shade100
                                                    ]
                                                  : [
                                                      AppColors.red,
                                                      AppColors.red.shade100
                                                    ]),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              "\$ ${snapshot.data![index].currentPrice.toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(snapshot
                                                  .data![index].priceChange24h!
                                                  .toStringAsFixed(2)),
                                              const SizedBox(width: 8),
                                              Text(snapshot.data![index]
                                                  .marketCapChangePercentage24h!
                                                  .toStringAsFixed(2)),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Divider(height: 1, thickness: 0.3),
                                )
                              ],
                            ),
                          );
                        },
                      );
              }
            }),
      ),
    );
  }
}
