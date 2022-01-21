import 'package:store_management/sdk/proxies/invoice.dart';

class InvoiceAddedEvent {
  final Invoice invoice;
  InvoiceAddedEvent(this.invoice);
}
