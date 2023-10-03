
class Item {
  final String title;
  final List<String> itemImage;
  final String shopName;
  final String details;
  final String category;
  final int sellCount;
  final int price;

  const Item({
    required this.title,
    required this.itemImage,
    required this.shopName,
    required this.details,
    required this.category,
    required this.sellCount,
    required this.price,
  });
}