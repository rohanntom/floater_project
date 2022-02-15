import 'package:floater/floater.dart';
import 'package:flutter/material.dart';
import 'package:store_management/sdk/models/line_item.dart';

class LineItemTile extends StatelessWidgetBase {
  final LineItem lineItem;

  const LineItemTile({
    required this.lineItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Product: ${lineItem.productName}'),
          subtitle: Text.rich(
            TextSpan(
              text: 'Quantity: ${lineItem.quantity}\n',
              children: [
                TextSpan(text: 'Mrp: \$${lineItem.mrp}\n'),
                TextSpan(text: 'Tax: \$${lineItem.tax.toStringAsFixed(2)}\n'),
                TextSpan(
                    text: 'Amount: \$${lineItem.amount.toStringAsFixed(2)}\n')
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
