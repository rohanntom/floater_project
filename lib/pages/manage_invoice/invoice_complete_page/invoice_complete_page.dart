import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'invoice_complete_page_state.dart';

class InvoiceCompletePage extends StatefulWidgetBase<InvoiceCompletePageState> {
  InvoiceCompletePage() : super(InvoiceCompletePageState.new);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Invoice Completed'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your total is \$${this.state.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22),
            ),
            const Text(
              '\nThanks for shopping.',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'Visit Again..!\n',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: this.state.done,
              child: const Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}
