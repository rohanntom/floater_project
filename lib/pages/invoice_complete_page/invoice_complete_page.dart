import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'invoice_complete_page_state.dart';

class InvoiceCompletePage extends StatefulWidgetBase<InvoiceCompletePageState> {
  InvoiceCompletePage() : super(() => InvoiceCompletePageState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Invoice Completed'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your total is........ ',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '\nThanks for shopping.',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Visit Again..!\n',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}
