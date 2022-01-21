import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/lineItem.dart';
import 'package:store_management/widgets/loading_spinner/loading_spinner.dart';

import '../lineItem_tile.dart';
import 'bottom_container.dart';
import 'invoice_state.dart';

class InvoicePage extends StatefulWidgetBase<InvoicePageState> {
  InvoicePage() : super(() => InvoicePageState());

  @override
  Widget build(BuildContext context) {
    // this.state.currentTab
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Invoice",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: this.state.onClick,
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Stack(
        children: [
          this._buildBody(context),
          Positioned(
            child: BottomContainer(),
            bottom: 0,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (this.state.isLoading)
      return Container(
        child: Center(
          child: LoadingSpinner(),
        ),
      );

    if (this.state.lineItems.isEmpty)
      return Container(
        child: Center(
          child: Text(
            "No items added yet :(",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: this.state.lineItems.length,
      itemBuilder: (context, index) =>
          this._buildListTile(this.state.lineItems[index]),
    );
  }

  Widget _buildListTile(LineItem lineItem) {
    return LineItemTile(
      lineItem: lineItem,
    );
  }
}
