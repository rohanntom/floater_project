import 'package:store_management/sdk/models/lineItem.dart';

class InvoiceDto {
  String id;
  DateTime date;
  List<LineItem> lineItems;

  InvoiceDto(this.id, this.date, this.lineItems);
}
