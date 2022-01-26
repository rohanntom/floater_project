import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/invoice/lineItem_tile.dart';
import 'package:store_management/sdk/models/lineItem.dart';
import 'package:store_management/widgets/loading_spinner/loading_spinner.dart';

import 'bottom_container.dart';
import 'invoice_state.dart';

class InvoicePage extends StatefulWidgetBase<InvoicePageState> {
  InvoicePage() : super(InvoicePageState.new);

  @override
  Widget build(BuildContext context) {
    // this.state.currentTab
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Invoice",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: this.state.onClick,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Stack(
        children: [
          this._buildBody(context),
          Positioned(
            bottom: 0,
            child: BottomContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (this.state.isLoading) {
      return Center(
        child: LoadingSpinner(),
      );
    } else if (this.state.lineItems.isEmpty) {
      return const Center(
        child: Text(
          "No items added yet :(",
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: this.state.lineItems.length,
        itemBuilder: (context, index) =>
            this._buildListTile(this.state.lineItems[index]),
      );
    }
  }

  Widget _buildListTile(LineItem lineItem) {
    return LineItemTile(
      lineItem: lineItem,
    );
  }
}
