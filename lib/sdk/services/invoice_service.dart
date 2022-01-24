import 'package:store_management/sdk/models/lineItem.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';

abstract class InvoiceService {
  Future<void> createInvoice(List<LineItem> lineItems);
  Future<List<Invoice>> getAllInvoices();
  Future<Invoice> getInvoice(String id);
}
