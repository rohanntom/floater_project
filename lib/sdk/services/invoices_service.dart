import 'package:store_management/sdk/models/line_item.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';

abstract class InvoicesService {
  Future<Invoice> createInvoice(List<LineItem> lineItems);
  Future<List<Invoice>> getAllInvoices();
  Future<Invoice> getInvoice(String id);
}
