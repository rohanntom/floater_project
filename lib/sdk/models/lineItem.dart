class LineItem {
  String productName;
  double quantity;
  double mrp;

  double get amount {
    return this.mrp * this.quantity * 0.18;
  }

  double get tax {
    return this.mrp * 0.18;
  }

  LineItem(this.productName, this.quantity, this.mrp);
}
