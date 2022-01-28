import 'package:flutter/cupertino.dart';
import 'package:store_management/sdk/models/line_item.dart';

import 'invoice.dart';
import 'invoice_dto.dart';

class MockInvoicesProxy implements Invoice {
  InvoiceDto _invoiceDto;

  MockInvoicesProxy(this._invoiceDto);

  @override
  String get invoiceId => this._invoiceDto.invoiceId;

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
    final newInvoiceDto =
        InvoiceDto(this.invoiceId, this.date, newLineItemList);
    this._invoiceDto = newInvoiceDto;
  }

  @override
  double get totalAmount {
    var totalAmount = 0.0;
    for (var i = 0; i < this.lineItems.length; i++) {
      final lineItem = this.lineItems[i];
      totalAmount = totalAmount + lineItem.amount;
    }
    return totalAmount;
  }

  @override
  double get totalTax {
    var totalTax = 0.0;
    for (var i = 0; i < this.lineItems.length; i++) {
      final lineItem = this.lineItems[i];
      totalTax = totalTax + lineItem.tax;
    }
    return totalTax;
  }
}
