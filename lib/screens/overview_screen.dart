import '../providers/business/summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../screens/daily_revenues_screen.dart';
import '../screens/monthly_revenues_screen.dart';
import '../screens/redeem_item_screen.dart';
import '../widgets/shop_tile.dart';
import '../widgets/border_all_text.dart';
import '../widgets/bubble_tarbar.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final String shopName = 'Cafeca Coffee Shop';

  final String imageUrl =
      'https://images.unsplash.com/photo-1546541865-1cb39bcd0c83?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80';

  bool isModalOpen = false;
  bool isLoading = false;
  Summary dailySummary;
  Summary monthlySummary;

  @override
  void initState() {
    final dataTool = Provider.of<Summary>(context, listen: false);
    dataTool.fetchSummary('daily').then((_){
      dailySummary = dataTool.summarize['daily'];
    });
    dataTool.fetchSummary('monthly').then((_){
      dailySummary = dataTool.summarize['monthly'];
    });
    super.initState();
  }

  void toggleModal(bool state) {
    setState(() {
      isModalOpen = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _deviceData = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Scaffold(
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
                        DailyRevenuesScreen(summary:  dailySummary,),
                        MonthlyRevenuesScreen(summary:  monthlySummary,),
                        Icon(Icons.directions_bike),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              toggleModal(true);
            },
          ),
        ),
        // Consumer<GivenCards>(
        //     builder: (BuildContext context, value, Widget child) {
        //   toggleModal(true);
        //   return RedeemItemScreen(
        //     data: value,
        //     onCancelBtnPressed: () {
        //       toggleModal(false);
        //     },
        //     onCheckBtnPressed: () {
        //       toggleModal(false);
        //     },
        //   );
        // }),
        if (isModalOpen)
          RedeemItemScreen(
            onCancelBtnPressed: () {
              toggleModal(false);
            },
            onCheckBtnPressed: () {
              toggleModal(false);
            },
          ),
      ],
    );
  }
}
