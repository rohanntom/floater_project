import 'package:floater/floater.dart';
import 'package:store_management/sdk/models/lineItem.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';

import 'package:store_management/sdk/proxies/invoice/invoice_dto.dart';
import 'package:store_management/sdk/services/invoices_service.dart';

class InvoiceManagementService {
  final _invoiceService = ServiceLocator.instance.resolve<InvoicesService>();
  final _invoice = ServiceLocator.instance.resolve<Invoice>();
  InvoiceDto? _invoiceDto;
  List<LineItem> get lineItems => this._invoiceDto!.lineItems;
  Future<double> get totalAmount => this._invoice.calcTotalAmount();

  String? _productName;
  String? get productName => this._productName;

  double? _quantity;
  double? get quantity => this._quantity;

  double? _mrp;
  double? get mrp => this._mrp;

  Future<void> addItem(String productName, double quantity, double mrp) async {
    if (this._invoiceDto!.id == null) {
      await this._invoiceService.createInvoice(lineItems);
    }
    await this
        ._invoice
        .addLineItem(this.productName!, this.quantity!, this.mrp!);
    return;
  }
}
