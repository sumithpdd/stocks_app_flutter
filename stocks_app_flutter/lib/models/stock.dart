class Stock {
  final String symbol;
  final String description;
  final double price;
  final String change;

  Stock({this.symbol, this.description, this.price, this.change});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json["symbol"],
      description: json["description"],
      price: json["price"].toDouble(),
      change: json["change"],
    );
  }
}
