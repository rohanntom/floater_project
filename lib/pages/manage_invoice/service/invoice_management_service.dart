import 'package:floater/floater.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_management/sdk/models/line_item.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/services/invoices_service.dart';

class InvoiceManagementService extends ChangeNotifier {
  final _invoiceService = ServiceLocator.instance.resolve<InvoicesService>();

  Invoice? _invoice;
  List<LineItem> get lineItems => this._invoice?.lineItems ?? [];
  double get totalAmount => this._invoice?.totalAmount ?? 0;

  Future<void> addItem(String productName, double quantity, double mrp) async {
    if (this._invoice == null) {
      this._invoice = await this._invoiceService.createInvoice(lineItems);
      //this.notifyListeners();
    }
    await this._invoice!.addLineItem(productName, quantity, mrp);
    this.notifyListeners();
    return;
  }
}
