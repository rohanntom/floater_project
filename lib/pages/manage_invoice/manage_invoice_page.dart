import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/widgets/loading_spinner/loading_spinner.dart';
import '../routes.dart';
import 'manage_invoice_page_state.dart';

class ManageInvoicePage extends StatefulWidgetBase<ManageInvoicePageState> {
  ManageInvoicePage() : super(() => ManageInvoicePageState());

  @override
  Widget build(BuildContext context) {
    return
        // this.state.isServiceInitialized
        //     ? ScopedNavigator(
        //         Routes.ManageInvoicePage,
        //         initialRoute: Routes.manageTodoTitle,
        //         scope: this.state.scope,
        //       )
        //     :
        this._buildLoadingScreen();
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      body: Container(
        child: SizedBox.expand(
          child: Container(
            alignment: Alignment.center,
            child: LoadingSpinner(),
          ),
        ),
      ),
    );
  }
}
