import 'package:store_management/sdk/models/line_item.dart';

abstract class Invoice {
  String get invoiceId;
  DateTime get date;
  List<LineItem> get lineItems;

  Future<void> addLineItem(String productName, double quantity, double mrp);
  double get totalAmount;
  double get totalTax;
}
