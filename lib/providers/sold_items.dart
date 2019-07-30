import 'package:flutter/foundation.dart';

class SoldItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String colorVal;

  SoldItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    this.colorVal,
  });
}

class SoldItems with ChangeNotifier {
  Map<String, SoldItem> _items = {
    'p1':SoldItem(
      id: 'i1',
      price: 180.0,
      quantity: 11,
      title: 'item1',
      colorVal: '0xffeb4034',
    ),
    'p2':
    SoldItem(
      id: 'i2',
      price: 120.0,
      quantity: 11,
      title: 'item2',
      colorVal: '0xff2b3ae3',
    ),
    'p3':SoldItem(
      id: 'i3',
      price: 210.0,
      quantity: 6,
      title: 'item3',
      colorVal: '0xffe6d81c',
    ),
    'p4':SoldItem(
      id: 'i4',
      price: 160.0,
      quantity: 16,
      title: 'item4',
      colorVal: '0xff8d24ad',
    ),
    'p5':SoldItem(
      id: 'i5',
      price: 280.0,
      quantity: 2,
      title: 'item5',
      colorVal: '0xff248dad',
    ),
  };

 
  Map<String, SoldItem> get items {
    return {..._items};
  }
  int get itemCount {
    var sum = 0;
    _items.forEach((_, soldItem) {
      sum += soldItem.quantity;
    });
    return sum;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, soldItem) {
      total += soldItem.price * soldItem.quantity;
    });
    return total;
  }

  // void addItem(
  //   String productId,
  //   double price,
  //   String title,
  //   int quantity,
  //   String colorVal,
  // ) {
  //   if (_items.containsKey(productId)) {
  //     //change quantity
  //     _items.update(
  //         productId,
  //         (existingSoldItem) => SoldItem(
  //               id: existingSoldItem.id,
  //               title: existingSoldItem.title,
  //               price: existingSoldItem.price,
  //               colorVal: colorVal,
  //               quantity: existingSoldItem.quantity + quantity,
  //             )); //  the new CartIteam is created based on the existing one and replace the old one.
  //   } else {
  //     _items.putIfAbsent(
  //       productId,
  //       () => SoldItem(
  //             id: DateTime.now().toString(),
  //             title: title,
  //             price: price,
  //             colorVal: colorVal,
  //             quantity: quantity,
  //           ),
  //     );
  //   }
  //   notifyListeners();
  // }
}
// List<SoldItem> soldItems = [
//       SoldItem(
//         id: 'i1',
//         price: 19.0,
//         quantity: 11,
//         title: 'item1',
//         colorVal: '0xffeb4034',
//       ),
//       SoldItem(
//         id: 'i2',
//         price: 21.0,
//         quantity: 11,
//         title: 'item2',
//         colorVal: '0xff2b3ae3',
//       ),
//       SoldItem(
//         id: 'i3',
//         price: 19.0,
//         quantity: 6,
//         title: 'item3',
//         colorVal: '0xffe6d81c',
//       ),
//       SoldItem(
//         id: 'i4',
//         price: 19.0,
//         quantity: 16,
//         title: 'item4',
//         colorVal: '0xff8d24ad',
//       ),
//     ];