import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'home_page_state.dart';

class HomePage extends StatefulWidgetBase<HomePageState> {
  HomePage() : super(() => HomePageState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'Store Management',
        ),
      ),
      body: MenuLine(
        onCreateInvoiceTap: this.state.onClickCreateInvoice,
        onViewTotalSalesTap: this.state.onClickTotalSales,
        onViewInvoicesTap: this.state.onClickViewInvoices,
      ),
    );
  }
}

class MenuLine extends StatelessWidget {
  final VoidCallback onCreateInvoiceTap;
  final VoidCallback onViewTotalSalesTap;
  final VoidCallback onViewInvoicesTap;
  const MenuLine({
    required this.onCreateInvoiceTap,
    required this.onViewTotalSalesTap,
    required this.onViewInvoicesTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        menuLineBuilder(
            'Create a new invoice', Icons.create_outlined, onCreateInvoiceTap),
        menuLineBuilder(
            'View total sales', Icons.payments_outlined, onViewTotalSalesTap),
        menuLineBuilder(
            'Show all invoices', Icons.view_agenda_outlined, onViewInvoicesTap)
      ],
    );
  }

  Widget menuLineBuilder(String title, IconData icon, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 15),
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          onTap: onTap,
        ),
        Divider(
          height: 5,
          thickness: 1,
        ),
      ],
    );
  }
}
