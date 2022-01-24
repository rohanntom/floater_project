import 'package:floater/floater.dart';
import 'package:flutter/material.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/services/invoice_service.dart';
import 'view_all_invoices_page.dart';

class ViewAllInvoicesPageState extends WidgetStateBase<ViewAllInvoicesPage> {
  ViewAllInvoicesPageState() : super() {
    this.onInitState(
      () async {
        await this._loadInvoices();
      },
    );
  }
  List<Invoice> _invoices = [];
  List<Invoice> get invoices => this._invoices;
  late Invoice invoice;
  final _invoiceService = ServiceLocator.instance.resolve<InvoiceService>();

  Future<void> _loadInvoices() async {
    this.showLoading();
    try {
      this._invoices = await this._invoiceService.getAllInvoices();
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
