import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import '../../routes.dart';
import 'manage_invoice_page_state.dart';

class ManageInvoicePage extends StatefulWidgetBase<ManageInvoicePageState> {
  ManageInvoicePage(String? invoiceId)
      : super(() => ManageInvoicePageState(invoiceId));

  @override
  Widget build(BuildContext context) {
    return ScopedNavigator(
      Routes.manageInvoicePage,
      initialRoute: Routes.invoicePage,
      scope: this.state.scope,
    );
  }
}
