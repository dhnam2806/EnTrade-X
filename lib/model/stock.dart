class Stock {
  final String name;
  final double price;
  final double priceChange;
  final double changePercent;
  final int total;

  Stock(
      {required this.name,
      required this.price,
      required this.priceChange,
      required this.changePercent,
      required this.total});
}
