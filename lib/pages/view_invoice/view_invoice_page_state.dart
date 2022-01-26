import 'package:floater/floater.dart';
import 'package:flutter/material.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/services/invoices_service.dart';
import 'view_invoice_page.dart';

class ViewInvoicePageState extends WidgetStateBase<ViewInvoicePage> {
  ViewInvoicePageState() : super() {
    this.onInitState(
      () async {
        await this._loadInvoices();
      },
    );
  }
  List<Invoice> _invoices = [];
  List<Invoice> get invoices => this._invoices;
  late Invoice invoice;
  final _invoicesService = ServiceLocator.instance.resolve<InvoicesService>();

  Future<void> _loadInvoices() async {
    this.showLoading();
    try {
      this._invoices = await this._invoicesService.getAllInvoices();
    } catch (e) {
      debugPrint(e.toString());
      return;
    } finally {
      this.hideLoading();
    }
  }
}

// class InvoicePageState extends WidgetStateBase<InvoicePage> {
//   final ServiceLocator _scope = ServiceManager.instance.createScope();
//   ServiceLocator get scope => this._scope;

//   InvoicePageState() : super();
//   late List<LineItem> _lineItems;
//   List<LineItem> get lineItems => this._lineItems;

//   final _navigator = NavigationService.instance.retrieveNavigator("/");
//   void onClick() {
//     this._navigator.pushNamed(Routes.receiveInputPage);
//   }
