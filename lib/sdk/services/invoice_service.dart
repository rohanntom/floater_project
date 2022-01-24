import 'package:store_management/sdk/proxies/invoice.dart';

abstract class InvoiceService {
  Future<void> createInvoice(String id, List lineItems);
  Future<List<Invoice>> getAllInvoices();
  Future<Invoice> getInvoice(String id);
}
