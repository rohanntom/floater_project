import 'package:floater/floater.dart';
import 'package:store_management/events/invoice_added_event.dart';
import 'package:store_management/sdk/proxies/invoice.dart';

import 'invoice_dto.dart';

class MockInvoicesProxy implements Invoice {
  final _eventAggregator = ServiceLocator.instance.resolve<EventAggregator>();

  InvoiceDto _dto;

  MockInvoicesProxy(this._dto);

  @override
  String get id => this._dto.date as String;

  @override
  List get invoice => this._dto.lineItems;

  @override
  Future<void> update(String title, String? description) async {
    await Future.delayed(Duration(seconds: 2));

    final newDto = InvoiceDto(this.lineItems);
    this._dto = newDto;
    this._eventAggregator.publish(InvoiceAddedEvent(this));
  }

  @override
  factory MockInvoicesProxy.create(InvoiceDto dto) {
    return MockInvoicesProxy(dto);
  }
}
