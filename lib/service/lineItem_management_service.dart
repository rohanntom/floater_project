import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/lineItem_dto.dart';
import 'package:store_management/sdk/services/lineItem_service.dart';

class LineItemManagementService {
  final _lineItemService = ServiceLocator.instance.resolve<LineItemService>();

  LineItemDto? _lineItem;

  bool get isNewLineItem => this._lineItem == null;

  String? _productName;
  String? get productName => this._productName;

  double? _quantity;
  double? get quantity => this._quantity;

  double? _mrp;
  double? get mrp => this._mrp;

  Future<void> init() async {
    // if (id != null) this._lineItem = await this._lineItemService.(id);
    // if a todo is passed copy the title and description or else leave it null.
    this._productName = this._lineItem?.productName;
    this._quantity = this._lineItem?.quantity;
    this._mrp = this._lineItem?.mrp;
  }

  void setProductName(String productName) {
    given(productName, "productName")
        .ensure((t) => t.isNotEmptyOrWhiteSpace && t.trim().length < 50);

    this._productName = productName;
  }

  void setQuantity(double quantity) {
    given(quantity, "quantity").ensure((t) => t > 0);

    this._quantity = quantity;
  }

  void setMRP(double mrp) {
    given(mrp, "MRP").ensure((t) => t > 0);

    this._mrp = mrp;
  }

  Future<void> complete() async {
    given(this, "this").ensure((t) => t._productName != null);

    if (this.isNewLineItem) {
      await this
          ._lineItemService
          .createLineItem(this._productName!, this.quantity!, this.mrp!);
      return;
    }

    //await this._lineItem!.update(this._productName!, this._quantity);
  }
}
