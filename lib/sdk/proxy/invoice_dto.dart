import 'package:store_management/sdk/proxy/lineItem_dto.dart';

class InvoiceDto {
  final date = DateTime.now();
  List<LineItemDto> lineItems = [];

  void addItem(String productName, double quantity, double mrp) {
    final lineItem =
        LineItemDto(productName: productName, quantity: quantity, mrp: mrp);

    this.lineItems.add(lineItem);
  }

  double calcTotalAmount() {
    double totalAmount = 0;
    for (var lineItem in this.lineItems) {
      totalAmount = totalAmount + lineItem.amount;
    }
    return totalAmount;
  }

  double calcTotalTax() {
    double totalTax = 0;
    for (var lineItem in this.lineItems) {
      totalTax = totalTax + lineItem.tax;
    }
    return totalTax;
  }
}
