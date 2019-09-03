/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../providers/assert/given_cards.dart';
import '../providers/assert/given_card.dart';

// ================================
//         Pie Chart ref
// ================================
// https://pub.dev/packages/charts_flutter
// https://flutterawesome.com/create-charts-using-charts_flutter-plugin-in-the-chart-data-from-the-firestore/

class DonutAutoLabelChart extends StatelessWidget {
  final GivenCards givenCardsData;
  DonutAutoLabelChart({this.givenCardsData});

  List<charts.Series<GivenCard, String>> seriesPieData;
  List<GivenCard> mydata;
  void _generateData(mydata) {
    seriesPieData = List<charts.Series<GivenCard, String>>();
    seriesPieData.add(
      charts.Series(
          domainFn: (GivenCard givenCard, _) => givenCard.title,
          measureFn: (GivenCard givenCard, _) =>
              ,
          colorFn: (GivenCard soldItem, _) => charts.ColorUtil.fromDartColor(
              Color(int.parse('0xff8d24ad'))),// use random color later
              // Color(int.parse(soldItem.colorVal))),
          id: 'soldItems',
          data: mydata,
          labelAccessorFn: (GivenCard item, _) {
            String percentage;
            percentage = (double.parse(
                        (item.price * item.quantity / givenCardsData.totalAmount)
                            .toStringAsFixed(2)) *
                    100)
                .toStringAsFixed(0);
            return "${item.title} ($percentage%)";
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<GivenCard> soldItems = givenCardsData.items.values.toList();
    return _buildChart(context, soldItems);
  }

  Widget _buildChart(BuildContext context, List<GivenCard> givenCardsData) {
    mydata = givenCardsData;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                '各品項所佔比例',
                style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(
                  seriesPieData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 30,
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.outside)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
