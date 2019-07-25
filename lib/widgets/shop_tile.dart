import 'package:flutter/material.dart';

class ShopTile extends StatelessWidget {
  @required final String imageUrl;
  @required final String shopName;
  final EdgeInsetsGeometry padding;
  final double circleAvatarRadius;
  final double fontSize;
  final double gutter;

  ShopTile({
    this.imageUrl,
    this.shopName,
    this.padding,
    this.circleAvatarRadius,
    this.fontSize,
    this.gutter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding != null ? padding : EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: circleAvatarRadius != null ? circleAvatarRadius : 80.0,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(
            width: gutter != null ? gutter : 30.0,
          ),
          Text(
            shopName,
            style: TextStyle(
              fontSize: fontSize != null ? fontSize : 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
