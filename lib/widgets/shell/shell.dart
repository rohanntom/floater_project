import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'package:store_management/pages/routes.dart';

class Shell extends StatelessWidgetBase {
  @override
  Widget build(BuildContext context) {
    return ScopedNavigator(
      "/",
      initialRoute: Routes.splash,
    );
  }
}
