import 'package:floater/floater.dart';
import 'package:flutter/material.dart';
import 'package:store_management/pages/routes.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/services/invoices_service.dart';
import 'view_all_invoices_page.dart';

class ViewAllInvoicesPageState extends WidgetStateBase<ViewAllInvoicesPage> {
  final _navigator = NavigationService.instance.retrieveNavigator("/");
  ViewAllInvoicesPageState() : super() {
    this.onInitState(
      () async {
        await this._loadInvoices();
      },
    );
  }
  List<Invoice> _invoices = [];
  List<Invoice> get invoices => this._invoices;
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

  Future<void> onClickInvoice(Invoice invoice) async {
    //print(invoice.invoiceId);
    await this._navigator.pushNamed(
      NavigationService.instance.generateRoute(Routes.manageInvoicePage),
      arguments: {
        "invoiceId": invoice.invoiceId,
      },
    );
    this.triggerStateChange();
  }
}
