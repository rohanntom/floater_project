import 'package:floater/floater.dart';
import 'package:store_management/events/lineItem_added_event.dart';
import 'package:store_management/sdk/proxy/lineItem.dart';
import 'package:store_management/sdk/proxy/lineItem_dto.dart';

import 'lineItem_service.dart';

class MockLineItemService implements LineItemService {
  final _eventAggregator = ServiceLocator.instance.resolve<EventAggregator>();
  List<LineItem> _invoice = [];

  MockLineItemService() {
    this._invoice = List.generate(
        5,
        (index) => LineItemDto(
              productName: "Product number ${index + 1}",
              quantity: index + 1,
              mrp: index + 10,
            ));
  }

  @override
  Future<void> createLineItem(
      String productName, double quantity, double mrp) async {
    given(productName, "productName").ensure((t) => t.isNotEmptyOrWhiteSpace);
    given(quantity, "quantity").ensure((t) => t != null);
    given(mrp, "mrp").ensure((t) => t != null);

    // fake network delay
    await Future.delayed(Duration(seconds: 1));

    final index = this._invoice.isEmpty
        ? 1
        : this
            ._invoice
            .map((t) => int.parse(t.id.split("_")[1]))
            .toList()
            .orderByDesc()[0];

    final mockLineItemDto = LineItemDto(
      productName: productName,
      quantity: quantity,
      mrp: mrp,
    );

    final mockLineItem = MockLineItemProxy(mockLineItemDto);
    this._eventAggregator.publish(LineItemAddedEvent(mockLineItem));
    this._invoice.add(mockLineItem);
  }

  @override
  Future<List<LineItem>> getAllInvoices() async {
    // fake network delay
    await Future.delayed(Duration(seconds: 1));

    return this._invoice.map((e) => e).toList();
  }

  @override
  Future<LineItem> getInvoice(String id) async {
    given(id, "id").ensure((t) => t.isNotEmptyOrWhiteSpace);

    // fake network delay
    await Future.delayed(Duration(seconds: 2));

    return this._invoice.find((e) => e.id == id)!;
  }
}
