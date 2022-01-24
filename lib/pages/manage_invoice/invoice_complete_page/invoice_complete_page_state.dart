import 'package:floater/floater.dart';
import '../../routes.dart';
import 'invoice_complete_page.dart';

class InvoiceCompletePageState extends WidgetStateBase<InvoiceCompletePage> {
  final _rootNavigator = NavigationService.instance.retrieveNavigator("/");
  final _scopedNavigator =
      NavigationService.instance.retrieveNavigator(Routes.manageInvoicePage);
  InvoiceCompletePageState() : super();
  void back() {
    this._scopedNavigator.pop();
  }

  void done() {
    this._rootNavigator.pop();
  }
}
