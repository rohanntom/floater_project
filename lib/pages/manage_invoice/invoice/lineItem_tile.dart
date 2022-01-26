import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/sdk/models/lineItem.dart';

class LineItemTile extends StatelessWidgetBase {
  final LineItem lineItem;

  const LineItemTile({
    required this.lineItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Product: ${lineItem.productName}'),
      subtitle: Text.rich(
        TextSpan(
          text: 'Quantity: ${lineItem.quantity}\n',
          children: [
            TextSpan(text: 'Mrp: ${lineItem.mrp}\n'),
            TextSpan(text: 'Tax: ${lineItem.tax}\n'),
            TextSpan(text: 'Amount: ${lineItem.amount}\n')
          ],
        ),
      ),
    );
  }
}
