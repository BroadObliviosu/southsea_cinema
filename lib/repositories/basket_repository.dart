import 'package:southsea_cinema/models/basket_item.dart';

class BasketRepository {
  BasketRepository._internal();

  static final BasketRepository instance = BasketRepository._internal();

  final List<BasketItem> _items = []; //

  List<BasketItem> getItems() {
    return List<BasketItem>.unmodifiable(_items);
  }

  void addItem(BasketItem item) {
    _items.add(item);
  }

  void removeItem(int index) {
    if (index >= 0 && index <_items.length) { //if the index is more than 0 and less than the items length
      _items.removeAt(index);
    }
  }

  double getTotal() {
    double total = 0.0;

    for (final BasketItem item in _items) {
      total += item.lineTotal;
    }
    return total;
  }

  void clear() {
    _items.clear(); //clears basket
  }
}
