import 'package:store_management/sdk/models/lineItem.dart';

abstract class Invoice {
  String get id;
  DateTime get date;
  List<LineItem> get lineItems;

  Future<void> addLineItem(String productName, double quantity, double mrp);
  Future<double> calcTotalAmount();
  Future<double> calcTotalTax();
}
