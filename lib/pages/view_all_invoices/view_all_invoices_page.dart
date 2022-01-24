import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/widgets/loading_spinner/loading_spinner.dart';
import 'view_all_invoices_page_state.dart';

class ViewAllInvoicesPage extends StatefulWidgetBase<ViewAllInvoicesPageState> {
  ViewAllInvoicesPage() : super(ViewAllInvoicesPageState.new);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Invoices",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          this._buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (this.state.isLoading) {
      return Center(
        child: LoadingSpinner(),
      );
    }

    if (this.state.invoices.isEmpty) {
      return const Center(
        child: Text(
          "No invoices yet :(",
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Invoice',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            this.state.invoice.id,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '${this.state.invoice.calcTotalAmount()}',
          )
        ],
      ),
    );
  }
}
