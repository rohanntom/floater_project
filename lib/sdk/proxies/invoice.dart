import 'package:store_management/sdk/proxies/lineItem_dto.dart';

abstract class Invoice {
  DateTime get date;
  List<LineItemDto> get lineItems;
}
