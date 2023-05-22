import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/constants/size_config.dart';
import 'package:crypto_app/provider/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopMoversWidget extends StatelessWidget {
  const TopMoversWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<APIServiceProvider>(builder: (context, snapshot, _) {
      return SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: snapshot.isLoad || snapshot.cryptoCoinsList.isEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 20, bottom: 8.0),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.white,
                        highlightColor: AppColors.primary100,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.white),
                        ),
                      ),
                    );
                  })
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.cryptoCoinsList.length,
                  itemBuilder: (context, i) {
                    return snapshot.cryptoCoinsList[i]
                                    .marketCapChangePercentage24h! >
                                6 &&
                            snapshot.cryptoCoinsList[i]
                                    .marketCapChangePercentage24h! <=
                                14
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 13, bottom: 8.0, left: 5.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow:  [
                                      BoxShadow(
                                          blurRadius: 3.0,
                                          color: AppColors.primary)
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.white),
                                child: SizedBox(
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: AppColors.white,
                                              backgroundImage: NetworkImage(
                                                  snapshot
                                                      .cryptoCoinsList[i].image
                                                      .toString()),
                                            ),
                                            Text(
                                                "${snapshot.cryptoCoinsList[i].marketCapChangePercentage24h!.toStringAsFixed(2)}%")
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        FittedBox(
                                          child: Text(
                                            snapshot.cryptoCoinsList[i].name
                                                .toString()
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                            "\$ ${snapshot.cryptoCoinsList[i].currentPrice}"),
                                      ],
                                    ),
                                  ),
                                )),
                          )
                        : const SizedBox.shrink();
                  }));
    });
  }
}
