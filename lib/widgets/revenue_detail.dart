import 'package:flutter/material.dart';

import '../prodivers/sold_items.dart';
import '../widgets/table_text.dart';

class RevenueDetail extends StatelessWidget {
  final SoldItems soldItemsData;
  const RevenueDetail({this.soldItemsData});
  @override
  Widget build(BuildContext context) {
    List<SoldItem> _soldItems = soldItemsData.items.values.toList();
    double _totalAmount = soldItemsData.totalAmount;
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
            itemCount: soldItemsData.items.length,
            itemBuilder: (_, i) => Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TableText(
                          title: _soldItems[i].title, color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: _soldItems[i].price.toString(), color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: _soldItems[i].quantity.toString(), color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: '${_soldItems[i].price * _soldItems[i].quantity}', color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: '${((_soldItems[i].price * _soldItems[i].quantity / _totalAmount)* 100).toStringAsFixed(2)}%', color: Colors.blueGrey, fontSize: 24.0),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
