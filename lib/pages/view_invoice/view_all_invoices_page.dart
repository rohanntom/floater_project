import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
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
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: this.state.invoices.length,
      itemBuilder: (context, index) =>
          this._buildListTile(this.state.invoices[index]),
    );
  }

  Widget _buildListTile(Invoice invoice) {
    return InkWell(
      onTap: () => this.state.onClickInvoice(invoice),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Invoice ID: ${invoice.invoiceId}',
            ),
            subtitle: Text(
              'Amount: \$${invoice.totalAmount.toStringAsFixed(2)}',
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
