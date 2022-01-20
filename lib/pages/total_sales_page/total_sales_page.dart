import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'total_sales_page_state.dart';

class TotalSalesPage extends StatefulWidgetBase<TotalSalesPageState> {
  TotalSalesPage() : super(() => TotalSalesPageState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Sales Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total number of invoices .... ',
              style: TextStyle(fontSize: 24),
            ),
            Divider(),
            Text(
              'Total Sales ....',
              style: TextStyle(fontSize: 24),
            ),
            Divider(),
            Text(
              'Total Tax ....',
              style: TextStyle(fontSize: 24),
            ),
            Divider(),
            Text(
              'Total Revenue ....',
              style: TextStyle(fontSize: 24),
            ),
            Divider(),
            SizedBox(
              height: 100,
            ),
            Center(
              child: ElevatedButton(
                onPressed: this.state.back,
                child: Text("Done"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
