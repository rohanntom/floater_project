import 'package:store_management/sdk/models/line_item.dart';

class InvoiceDto {
  String invoiceId;
  DateTime date;
  List<LineItem> lineItems;

  InvoiceDto(this.invoiceId, this.date, this.lineItems);
}
