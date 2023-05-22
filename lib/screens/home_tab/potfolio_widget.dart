import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: AppColors.primary,
      color: AppColors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Balance (USD)",
              style: TextStyle(
                  color: AppColors.grey, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$12345",
              style: TextStyle(
                  color: Colors.blueGrey.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Total Profit",
                          style: TextStyle(
                              fontSize: 11,
                              color: AppColors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text("+90.10", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 37,
                      width: 2,
                      color: AppColors.grey.shade300,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Today Profit",
                          style: TextStyle(
                              fontSize: 11,
                              color: AppColors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 2),
                        Text("-10.03",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.red)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                AppColors.primary400,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)) ),
                            onPressed: () {},
                            child:
                            const FittedBox(child: Text("Trade")))),
                    const SizedBox(width:10),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 5.5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.grey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
                            onPressed: () {},
                            child: const FittedBox(
                                child: Text("Transfer")))),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
