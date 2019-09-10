import 'package:cafeca_shop/providers/business/summary.dart';
import 'package:flutter/material.dart';

import '../widgets/donut_auto_label_chart.dart';
import '../widgets/revenue_detail.dart';

class DailyRevenuesScreen extends StatelessWidget {
  final Summary summary;

  const DailyRevenuesScreen({
    @required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 300,
                  child: DonutAutoLabelChart(
                    summaryData: summary,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      '今日兌換次數',
                      style: TextStyle(fontSize: 24.0, color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      summary.totalQuantity.toString(),
                      style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      '今日兌換金額',
                      style: TextStyle(fontSize: 24.0, color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      summary.totalAmount.toString(),
                      style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 1,
            child: RevenueDetail(
              summaryData: summary,
            ),
          ),
        ],
      ),
    );
  }
}
