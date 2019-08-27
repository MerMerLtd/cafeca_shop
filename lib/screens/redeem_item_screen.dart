import 'package:flutter/material.dart';
import '../widgets/tag.dart';

class RedeemItemScreen extends StatelessWidget {
  final Function onCheckBtnPressed;
  final Function onCancelBtnPressed;

  const RedeemItemScreen({
    Key key,
    @required this.onCancelBtnPressed,
    @required this.onCheckBtnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black12),
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Stack(
                    children: <Widget>[
                      Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 60, bottom: 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                    'https://images.unsplash.com/photo-1493807879848-13f1500cee7f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              child: GridView.builder(
                                padding: const EdgeInsets.all(10.0),
                                itemCount: 10,
                                itemBuilder: (ctx, i) => Tag(
                                  color: Theme.of(context).primaryColor,
                                  label: i.toString(),
                                ),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(100),
                                //   child: RaisedButton(
                                //     onPressed: () {},
                                //     child: Text(i.toString()),
                                //   ),
                                // ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 8 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                // scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // color: Colors.pink,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: <Widget>[
                                Spacer(),
                                FlatButton(
                                  shape: CircleBorder(),
                                  color: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.close,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  onPressed: onCancelBtnPressed,
                                ),
                                FlatButton(
                                  shape: CircleBorder(),
                                  color: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.check,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  onPressed: onCheckBtnPressed,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
