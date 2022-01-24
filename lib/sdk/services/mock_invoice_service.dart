import 'package:floater/floater.dart';
import 'package:store_management/events/invoice_added_event.dart';
import 'package:store_management/sdk/proxies/invoice.dart';
import 'package:store_management/sdk/proxies/invoice_dto.dart';
import 'package:store_management/sdk/proxies/mock_invoices_proxy.dart';

import 'invoice_service.dart';

class MockInvoiceService implements InvoiceService {
  final _eventAggregator = ServiceLocator.instance.resolve<EventAggregator>();
  List<Invoice> _allInvoices = [];

  // MockTodosService() {
  //   this._allInvoices = List.generate(
  //       5,
  //       (index) => MockInvoicesProxy(InvoiceDto(
  //           "tdo_${index + 1}",
  //           "Todo number ${index + 1}",
  //           "This is the description for Todo number ${index + 1}",
  //           false)));
  // }

  @override
  Future<void> createInvoice(String id, List lineItems) async {
    await Future.delayed(Duration(seconds: 1));

    final index = this._allInvoices.isEmpty
        ? 1
        : this
            ._allInvoices
            .map((t) => int.parse(t.id.split("_")[1]))
            .toList()
            .orderByDesc()[0];

    final mockInvoiceDto = InvoiceDto("tdo_${index + 1}", lineItems.productName,
        lineItems.quantity, lineItems.mrp);

    final mockInvoice = MockInvoicesProxy(mockInvoiceDto);
    this._eventAggregator.publish(InvoiceAddedEvent(mockInvoice));
    this._allInvoices.add(mockInvoice);
  }

  @override
  Future<List<Invoice>> getAllInvoices() async {
    await Future.delayed(Duration(seconds: 1));
    return this._allInvoices.map((e) => e).toList();
  }

  @override
  Future<Invoice> getInvoice(String id) async {
    given(id, "id").ensure((t) => t.isNotEmptyOrWhiteSpace);
    await Future.delayed(Duration(seconds: 1));
    return this._allInvoices.find((e) => e.id == id)!;
  }
}
