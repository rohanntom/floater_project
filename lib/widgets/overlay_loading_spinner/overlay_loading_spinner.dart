import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/widgets/loading_spinner/loading_spinner.dart';

class OverlayLoadingSpinner extends StatelessWidgetBase {
  final Widget child;
  final bool isEnabled;

  const OverlayLoadingSpinner({
    required this.child,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (this.isEnabled) ...[
          const Opacity(
            opacity: 0.3,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          Center(
            child: LoadingSpinner(),
          ),
        ]
      ],
    );
  }
}
