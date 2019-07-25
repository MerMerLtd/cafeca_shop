import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/daily_revenues_screen.dart';
import '../widgets/shop_tile.dart';
import '../widgets/border_all_text.dart';
import '../widgets/bubble_tarbar.dart';

class OverviewScreen extends StatelessWidget {
  final String shopName = 'Cafeca Coffee Shop';
  final String imageUrl =
      'https://images.unsplash.com/photo-1546541865-1cb39bcd0c83?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80';

  // const OverviewScreen({this.shopName, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    // final _deviceData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 60, vertical: 10), // whole page margin
          child: Column(
            children: <Widget>[
              //--- Shop image && Shop name
              ShopTile(shopName: shopName, imageUrl: imageUrl),
              //--- Divider
              Divider(),
              SizedBox(height: 20),
              //--- tab Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: BubbleTabBar(
                      tabs: [
                        Tab(child: BorderAllText(text: '本日營收')),
                        Tab(child: BorderAllText(text: '月結資訊')),
                        Tab(child: BorderAllText(text: '成長狀況')),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(
                        DateTime.now(),
                      ),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              // ---TabBarView
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    DailyRevenuesScreen(),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
