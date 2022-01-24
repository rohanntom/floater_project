abstract class Invoice {
  String get id;
  List get lineItems;

  Future<void> addLineItem(String productName, double quantity, double mrp);
  Future<double> calcTotalAmount();
  Future<double> calcTotalTax();
}
