import 'dart:io';

import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/models/crypto_data_model.dart';
import 'package:crypto_app/models/details_chart_model.dart';
import 'package:crypto_app/provider/charts_provider.dart';
import 'package:crypto_app/widget/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinDetailsScreen extends StatefulWidget {
  CryptoDataModel selectedCoin;
  CoinDetailsScreen({required this.selectedCoin, Key? key}) : super(key: key);

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  late TrackballBehavior trackballBehavior;
  @override
  void initState() {
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
    Provider.of<ChartsProvider>(context, listen: false)
        .getChartDetails(widget.selectedCoin.id);
    Provider.of<ChartsProvider>(context, listen: false)
        .getCoinDetails(widget.selectedCoin.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            widget.selectedCoin.image.toString(),
                            height: 55,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.selectedCoin.name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                widget.selectedCoin.symbol.toString(),
                                style: const TextStyle(
                                    color: AppColors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$ ${widget.selectedCoin.currentPrice}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${widget.selectedCoin.marketCapChangePercentage24h}%",
                            style: TextStyle(
                                color: widget.selectedCoin
                                            .marketCapChangePercentage24h! >=
                                        0
                                    ? AppColors.green
                                    : AppColors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 3,
                        shadowColor: AppColors.primary100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, bottom: 18.0, left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Low",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.grey,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(height: 4),
                                    FittedBox(
                                      child: Text(
                                        "\$ ${widget.selectedCoin.low24h}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    const Text(
                                      "High",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.grey,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(height: 4),
                                    FittedBox(
                                      child: Text(
                                        "\$ ${widget.selectedCoin.high24h}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Vol",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.grey,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(height: 4),
                                    FittedBox(
                                      child: Text(
                                        "\$ ${widget.selectedCoin.totalVolume} M",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Consumer<ChartsProvider>(
                          builder: (context, chartProvider, _) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: chartProvider.isLoadChart
                              ? const Loader()
                              : SfCartesianChart(
                                  trackballBehavior: trackballBehavior,
                                  zoomPanBehavior: ZoomPanBehavior(
                                      enablePanning: true,
                                      zoomMode: ZoomMode.x,
                                      enableDoubleTapZooming: true),
                                  series: [
                                    CandleSeries(
                                        enableTooltip: true,
                                        bullColor: AppColors.green,
                                        bearColor: AppColors.red,
                                        dataSource:
                                            chartProvider.coinDetailsChartList,
                                        xValueMapper:
                                            (CoinDetailChartModel m, _) =>
                                                m.time,
                                        lowValueMapper:
                                            (CoinDetailChartModel m, _) =>
                                                m.low,
                                        highValueMapper:
                                            (CoinDetailChartModel m, _) =>
                                                m.high,
                                        openValueMapper:
                                            (CoinDetailChartModel m, _) =>
                                                m.open,
                                        closeValueMapper:
                                            (CoinDetailChartModel m, _) =>
                                                m.close,
                                        animationDuration: 55)
                                  ],
                                ),
                        );
                      }),
                      const SizedBox(height: 10),
                      Consumer<ChartsProvider>(builder: (context, snapshot, _) {
                        return SizedBox(
                          height: 55,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.list.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      snapshot.changeBool(i);
                                      snapshot.setDays(snapshot.list[i].text);
                                      snapshot.getChartDetails(
                                          widget.selectedCoin.id);
                                    },
                                    child: Container(
                                      color: snapshot.list[i].isClick
                                          ? AppColors.primary200
                                          : AppColors.white,
                                      width: 48,
                                      child: Center(
                                        child: Text(snapshot.list[i].text),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }),
                      const SizedBox(height: 20),
                      Text(
                        "About ${widget.selectedCoin.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Consumer<ChartsProvider>(builder: (context, snapshot, _) {
                        return snapshot.isLoadCoin
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Shimmer.fromColors(
                                  baseColor: AppColors.white,
                                  highlightColor: AppColors.primary50,
                                  child: Container(
                                    height: 200,
                                    color: AppColors.white,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Html(data: snapshot.enDescCoin),
                              );
                      }),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        height: Platform.isIOS ? 70 : 55,
        child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: AppColors.white,
              size: 24,
            ),
            label:  Text(
              "Add to portfolio",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: Platform.isIOS ? 14 : 17,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
