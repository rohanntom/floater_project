import 'package:store_management/sdk/models/lineItem.dart';

import 'invoice.dart';
import 'invoice_dto.dart';

class MockInvoicesProxy implements Invoice {
  InvoiceDto _invoiceDto;

  MockInvoicesProxy(this._invoiceDto);

  @override
  String get id => this._invoiceDto.id;

  @override
  DateTime get date => this._invoiceDto.date;

  @override
  List<LineItem> get lineItems => this._invoiceDto.lineItems;

  @override
  Future<void> addLineItem(
    String productName,
    double quantity,
    double mrp,
  ) async {
    final newLineItem = LineItem(productName, quantity, mrp);
    final newLineItemList = [...this.lineItems, newLineItem];
    final newInvoiceDto = InvoiceDto(this.id, this.date, newLineItemList);
    this._invoiceDto = newInvoiceDto;
  }

  @override
  Future<double> calcTotalAmount() async {
    var totalAmount = 0.0;
    for (final lineItem in this.lineItems) {
      totalAmount = totalAmount + lineItem.amount;
    }
    return totalAmount;
  }

  @override
  Future<double> calcTotalTax() async {
    var totalAmountWithTax = 0.0;
    for (final lineItem in this.lineItems) {
      totalAmountWithTax = totalAmountWithTax + lineItem.tax;
    }

    return totalAmountWithTax;
  }
}
