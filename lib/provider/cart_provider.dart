import 'package:daraz_clone/models/item_model.dart';
import 'package:flutter/widgets.dart';

class CartProvider with ChangeNotifier{
  List<Item> list = [];

  add(Item item) {
    list.add(item);
    notifyListeners();
  }

  del(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}