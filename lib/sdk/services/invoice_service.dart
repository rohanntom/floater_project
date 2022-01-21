import 'package:store_management/sdk/proxies/invoice.dart';
import 'package:store_management/sdk/proxies/lineItem.dart';

abstract class InvoiceService {
  Future<void> createInvoice(DateTime date, List<LineItem> lineItems);
  Future<List<Invoice>> getAllInvoices();
  // Future<Invoice> getInvoice(String id);
}
