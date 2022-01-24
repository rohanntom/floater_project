import 'package:floater/floater.dart';
import 'package:store_management/events/lineItem_added_event.dart';
import 'package:store_management/sdk/proxies/invoice.dart';
import 'package:store_management/sdk/proxies/lineItem_dto.dart';

import 'invoice_dto.dart';

class MockInvoicesProxy implements Invoice {
  final _eventAggregator = ServiceLocator.instance.resolve<EventAggregator>();
  List<LineItemDto> _lineItems = [];
  InvoiceDto _invoiceDto;
  late LineItemDto _lineItemDto;

  MockInvoicesProxy(this._invoiceDto);

  @override
  String get id => this._invoiceDto.id;

  @override
  List get invoice => this._invoiceDto.lineItems;

  // @override
  // Future<void> update(String productName, double quantity, double mrp) async {
  //   await Future.delayed(Duration(seconds: 2));

  //   final newDto = InvoiceDto(this.lineItems);
  //   this._dto = newDto;
  //   this._eventAggregator.publish(InvoiceAddedEvent(this));
  // }

  @override
  factory MockInvoicesProxy.create(InvoiceDto dto) {
    return MockInvoicesProxy(dto);
  }

  @override
  Future<void> addLineItem(
      String productName, double quantity, double mrp) async {
    final newLineItem = LineItemDto(productName, quantity, mrp);
    this._lineItemDto = newLineItem;
    this._eventAggregator.publish(LineItemAddedEvent);
  }

  @override
  Future<double> calcTotalAmount() async {
    double totalAmount = 0;
    for (var lineItem in this._lineItems) {
      totalAmount = totalAmount + lineItem.amount;
    }
    return await totalAmount;
  }

  @override
  Future<double> calcTotalTax() async {
    double totalAmountWithTax = 0;
    for (var lineItem in this._lineItems) {
      totalAmountWithTax = totalAmountWithTax + lineItem.tax;
    }
    return totalAmountWithTax;
  }
}
