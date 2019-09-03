import 'package:flutter/material.dart';

import '../providers/assert/given_card.dart';
import '../providers/assert/given_cards.dart';
import '../widgets/table_text.dart';

class RevenueDetail extends StatelessWidget {
  final GivenCards givenCardsData;
  const RevenueDetail({this.givenCardsData});
  @override
  Widget build(BuildContext context) {
    List<GivenCard> _givenCards = givenCardsData.items.values.toList();
    double _totalAmount = givenCardsData.totalAmount;
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
            itemCount: givenCardsData.items.length,
            itemBuilder: (_, i) => Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TableText(
                          title: _givenCards[i].title, color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: _givenCards[i].price.toString(), color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: _givenCards[i].quantity.toString(), color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: '${_givenCards[i].price * _givenCards[i].quantity}', color: Colors.blueGrey, fontSize: 24.0),
                      TableText(
                          title: '${((_givenCards[i].price * _givenCards[i].quantity / _totalAmount)* 100).toStringAsFixed(2)}%', color: Colors.blueGrey, fontSize: 24.0),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
