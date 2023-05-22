import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/provider/api_service.dart';
import 'package:crypto_app/screens/market_tab/coin_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class WatchListWidget extends StatelessWidget {
  const WatchListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<APIServiceProvider>(builder: (context, snapshot, _) {
      return snapshot.isLoad || snapshot.cryptoCoinsList.isEmpty
          ? Shimmer.fromColors(
              baseColor: AppColors.white,
              highlightColor: AppColors.primary100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.white),
                    ),
                  );
                },
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow:  [
                        BoxShadow(blurRadius: 3.0, color: AppColors.primary)
                      ],
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CoinDetailsScreen(
                                          selectedCoin:
                                              snapshot.cryptoCoinsList[index],
                                        ))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor: AppColors.white,
                                      backgroundImage: NetworkImage(snapshot
                                          .cryptoCoinsList[index].image
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
                                            snapshot.cryptoCoinsList[index].name
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Text(
                                            "0.4 ${snapshot.cryptoCoinsList[index].symbol}")
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Sparkline(
                                    data: snapshot.cryptoCoinsList[index]
                                        .sparklineIn7d!.price!,
                                    lineWidth: 2.0,
                                    lineColor: AppColors.primary400,
                                    fillMode: FillMode.below,
                                    fillGradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.0, 0.7],
                                        colors: snapshot.cryptoCoinsList[index]
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
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$ ${snapshot.cryptoCoinsList[index].currentPrice}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Row(
                                      children: [
                                        Text(snapshot.cryptoCoinsList[index]
                                            .priceChange24h!
                                            .toStringAsFixed(2),style: const TextStyle(fontSize: 13),),
                                        const SizedBox(width: 10),
                                        Text(snapshot.cryptoCoinsList[index]
                                            .marketCapChangePercentage24h!
                                            .toStringAsFixed(2),style: const TextStyle(fontSize: 13),),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
