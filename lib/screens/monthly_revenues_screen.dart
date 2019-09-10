import 'package:flutter/material.dart';

import '../providers/business/summary.dart';
import '../widgets/donut_auto_label_chart.dart';
import '../widgets/revenue_detail.dart';

class MonthlyRevenuesScreen extends StatelessWidget {
  final Summary summary;

  const MonthlyRevenuesScreen({
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
                flex: 2,
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
                      '今月兌換次數',
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
                      '今月兌換金額',
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
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      '未出帳金額',
                      style: TextStyle(fontSize: 24.0, color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '0.0',
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
