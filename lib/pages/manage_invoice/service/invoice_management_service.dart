import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';

class InvoiceManagementService {
  final _invoice = ServiceLocator.instance.resolve<Invoice>();

  // InvoiceDto? _invoiceDto;

  late String _productName;
  String get productName => this._productName;

  late double _quantity;
  double get quantity => this._quantity;

  late double _mrp;
  double get mrp => this._mrp;

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
    await this._invoice.addLineItem(this._productName, this.quantity, this.mrp);
    return;
  }
}
