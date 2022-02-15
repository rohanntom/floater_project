import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'total_sales_page_state.dart';

class TotalSalesPage extends StatefulWidgetBase<TotalSalesPageState> {
  TotalSalesPage() : super(TotalSalesPageState.new);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Sales Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total number of invoices: ${this.state.invoices?.length ?? 0}',
              style: const TextStyle(fontSize: 24),
            ),
            const Divider(),
            Text(
              'Total Sales: \$${this.state.totalSale}',
              style: const TextStyle(fontSize: 24),
            ),
            const Divider(),
            Text(
              'Total Tax: \$${this.state.totalTax}',
              style: const TextStyle(fontSize: 24),
            ),
            const Divider(),
            Text(
              'Total Revenue: \$${this.state.totalRevenue}',
              style: const TextStyle(fontSize: 24),
            ),
            const Divider(),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ElevatedButton(
                onPressed: this.state.back,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
                child: const Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
