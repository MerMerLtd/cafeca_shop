import 'package:flutter/material.dart';

import '../providers/business/summary.dart';
import '../widgets/table_text.dart';

class RevenueDetail extends StatelessWidget {
  final Summary summaryData;
  const RevenueDetail({this.summaryData});
  @override
  Widget build(BuildContext context) {
    List<Item> _givenCards = summaryData.details;
    return Column(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TableText(title: '品項', color: Colors.white, fontSize: 24.0),
              TableText(title: '單價', color: Colors.white, fontSize: 24.0),
              TableText(title: '兌換次數', color: Colors.white, fontSize: 24.0),
              TableText(title: '金額', color: Colors.white, fontSize: 24.0),
              TableText(title: '百分比', color: Colors.white, fontSize: 24.0),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _givenCards.length,
            itemBuilder: (_, i) => Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TableText(
                          title: _givenCards[i].title, color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: _givenCards[i].priceAvg.toString(), color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: _givenCards[i].quantity.toString(), color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: '${_givenCards[i].amount}', color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: '${_givenCards[i].percentage.toStringAsFixed(2)}%', color: Colors.blueGrey, fontSize: 24.0),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
