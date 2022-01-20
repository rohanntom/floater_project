import 'package:floater/floater.dart';
import 'package:flutter/material.dart';
import 'package:store_management/widgets/shell/shell.dart';

class StoreApp extends StatelessWidgetBase {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shell(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
