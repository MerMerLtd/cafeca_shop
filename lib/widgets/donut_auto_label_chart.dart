/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../prodivers/sold_items.dart';

// ================================
//         Pie Chart ref
// ================================
// https://pub.dev/packages/charts_flutter
// https://flutterawesome.com/create-charts-using-charts_flutter-plugin-in-the-chart-data-from-the-firestore/

class DonutAutoLabelChart extends StatelessWidget {
  final SoldItems soldItemsData;
  DonutAutoLabelChart({this.soldItemsData});

  List<charts.Series<SoldItem, String>> seriesPieData;
  List<SoldItem> mydata;
  void _generateData(mydata) {
    seriesPieData = List<charts.Series<SoldItem, String>>();
    seriesPieData.add(
      charts.Series(
          domainFn: (SoldItem soldItem, _) => soldItem.title,
          measureFn: (SoldItem soldItem, _) =>
              soldItem.quantity * soldItem.price,
          colorFn: (SoldItem soldItem, _) => charts.ColorUtil.fromDartColor(
              Color(int.parse(soldItem.colorVal))),
          id: 'soldItems',
          data: mydata,
          labelAccessorFn: (SoldItem item, _) {
            String percentage;
            percentage = (double.parse(
                        (item.price * item.quantity / soldItemsData.totalAmount)
                            .toStringAsFixed(2)) *
                    100)
                .toStringAsFixed(0);
            return "${item.title} ($percentage%)";
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<SoldItem> soldItems = soldItemsData.items.values.toList();
    return _buildChart(context, soldItems);
  }

  Widget _buildChart(BuildContext context, List<SoldItem> soldItemsData) {
    mydata = soldItemsData;
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
