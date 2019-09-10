/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../providers/business/summary.dart';

// ================================
//         Pie Chart ref
// ================================
// https://pub.dev/packages/charts_flutter
// https://flutterawesome.com/create-charts-using-charts_flutter-plugin-in-the-chart-data-from-the-firestore/

class DonutAutoLabelChart extends StatelessWidget {
  final Summary summaryData;
  DonutAutoLabelChart({this.summaryData});

  List<charts.Series<Item, String>> seriesPieData;
  List<Item> mydata;
  void _generateData(mydata) {
    seriesPieData = List<charts.Series<Item, String>>();
    seriesPieData.add(
      charts.Series(
          domainFn: (Item item, _) => item.title,
          measureFn: (Item item, _) => item.amount,
          colorFn: (Item soldItem, _) => charts.ColorUtil.fromDartColor(
              Color(int.parse('0xff8d24ad'))), // use random color later
          // Color(int.parse(soldItem.colorVal))),
          id: 'soldItems',
          data: mydata,
          labelAccessorFn: (Item item, _) {
            String percentage;
            percentage =
                item.percentage.toStringAsFixed(2) * 100.toStringAsFixed(0);
            return "${item.title} ($percentage%)";
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Item> soldItems = summaryData.details;
    return _buildChart(context, soldItems);
  }

  Widget _buildChart(BuildContext context, List<Item> summaryData) {
    mydata = summaryData;
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
