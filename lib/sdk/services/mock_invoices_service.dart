import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/proxies/invoice/invoice_dto.dart';
import 'package:store_management/sdk/proxies/invoice/mock_invoice_proxy.dart';
import 'package:uuid/uuid.dart';
import 'invoices_service.dart';

class MockInvoicesService implements InvoicesService {
  final List<Invoice> _allInvoices = [];
  var uuid = const Uuid();

  @override
  Future<void> createInvoice(List lineItems) async {
    await Future.delayed(const Duration(seconds: 1));
    final invoiceId = uuid.v1();
    final date = DateTime.now();

    final mockInvoiceDto = InvoiceDto(invoiceId, date, []);

    final mockInvoice = MockInvoicesProxy(mockInvoiceDto);
    this._allInvoices.add(mockInvoice);
  }

  @override
  Future<List<Invoice>> getAllInvoices() async {
    await Future.delayed(const Duration(seconds: 1));
    return this._allInvoices.map((e) => e).toList();
  }

  @override
  Future<Invoice> getInvoice(String id) async {
    given(id, "id").ensure((t) => t.isNotEmptyOrWhiteSpace);
    await Future.delayed(const Duration(seconds: 1));
    return this._allInvoices.find((e) => e.id == id)!;
  }
}
