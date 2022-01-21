import 'lineItem_dto.dart';

class InvoiceDto {
  final date = DateTime.now();
  List<LineItemDto> lineItems = [];
}
