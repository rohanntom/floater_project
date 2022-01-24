import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/invoice.dart';

class InvoiceManagementService {
  final _invoice = ServiceLocator.instance.resolve<Invoice>();

  // InvoiceDto? _invoiceDto;

  String? _productName;
  String? get productName => this._productName;

  double? _quantity;
  double? get quantity => this._quantity;

  double? _mrp;
  double? get mrp => this._mrp;

  // Future<void> init() async {
  //   this._productName = this._invoiceDto!.lineItems.productName;
  //   this._quantity = this._invoiceDto?.lineItems.quantity;
  //   this._mrp = this._invoiceDto?.lineItems.mrp;
  // }

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
    await this
        ._invoice
        .addLineItem(this._productName!, this.quantity!, this.mrp!);
    return;
    //await this._lineItem!.update(this._productName!, this._quantity);
  }
}
