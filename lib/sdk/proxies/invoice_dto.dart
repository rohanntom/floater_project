import 'package:store_management/sdk/proxies/lineItem_dto.dart';

import 'lineItem_dto.dart';

class InvoiceDto {
  //String id = DateTime.now().toString();
  String id = DateTime.now().toString();
  List<LineItemDto> lineItems = [];

  InvoiceDto(this.id, this.lineItems);
}
