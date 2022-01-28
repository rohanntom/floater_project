import 'package:floater/floater.dart';
import 'package:flutter/material.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/services/invoices_service.dart';
import 'view_invoice_page.dart';

class ViewInvoicePageState extends WidgetStateBase<ViewInvoicePage> {
  final _navigator = NavigationService.instance.retrieveNavigator("/");
  ViewInvoicePageState() : super() {
    this.onInitState(
      () async {
        await this._loadInvoices();
      },
    );
  }
  List<Invoice> _invoices = [];
  List<Invoice> get invoices => this._invoices;
  Invoice? invoice;
  final _invoicesService = ServiceLocator.instance.resolve<InvoicesService>();

  Future<void> _loadInvoices() async {
    this.showLoading();
    try {
      this._invoices = await this._invoicesService.getAllInvoices();
    } catch (e) {
      debugPrint(e.toString());
      this._navigator.pop();
      return;
    } finally {
      this.hideLoading();
    }
  }
}
