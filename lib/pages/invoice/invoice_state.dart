import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/lineItem.dart';

import '../routes.dart';
import 'invoice.dart';

class InvoicePageState extends WidgetStateBase<InvoicePage> {
  final ServiceLocator _scope = ServiceManager.instance.createScope();
  ServiceLocator get scope => this._scope;

  InvoicePageState() : super() {}
  List<LineItem> _lineItems = [];
  List<LineItem> get lineItems => this._lineItems;

  final _navigator = NavigationService.instance.retrieveNavigator("/");
  void onClick() {
    this._navigator.pushNamed(Routes.receiveInputPage);
  }
}
