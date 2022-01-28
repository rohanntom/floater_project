import 'package:store_management/sdk/models/line_item.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/proxies/invoice/invoice_dto.dart';
import 'package:store_management/sdk/proxies/invoice/mock_invoice_proxy.dart';
import 'package:uuid/uuid.dart';
import 'invoices_service.dart';

class MockInvoicesService implements InvoicesService {
  final List<Invoice> _allInvoices = [];
  var uuid = const Uuid();

  @override
  Future<Invoice> createInvoice(List<LineItem> lineItems) async {
    await Future.delayed(const Duration(seconds: 1));
    final invoiceId = uuid.v1();
    final date = DateTime.now();

    final mockInvoiceDto = InvoiceDto(invoiceId, date, []);

    final mockInvoice = MockInvoicesProxy(mockInvoiceDto);
    this._allInvoices.add(mockInvoice);
    return mockInvoice;
  }

  @override
  Future<List<Invoice>> getAllInvoices() async {
    await Future.delayed(const Duration(seconds: 1));
    return this._allInvoices.map((e) => e).toList();
  }

  @override
  Future<Invoice> getInvoice(String id) {
    // TODO: implement getInvoice
    throw UnimplementedError();
  }

  // @override
  // Future<Invoice> getInvoice(String invoiceId) async {
  //   given(invoiceId, "invoiceId").ensure((t) => t.isNotEmptyOrWhiteSpace);
  //   await Future.delayed(const Duration(seconds: 1));
  //   return this._allInvoices.find((e) => e.invoiceId == invoiceId);
  // }
}
