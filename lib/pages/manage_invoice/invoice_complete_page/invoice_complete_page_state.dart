import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/service/invoice_management_service.dart';
import '../../routes.dart';
import 'invoice_complete_page.dart';

class InvoiceCompletePageState extends WidgetStateBase<InvoiceCompletePage> {
  final _rootNavigator = NavigationService.instance.retrieveNavigator("/");
  final _scopedNavigator =
      NavigationService.instance.retrieveNavigator(Routes.manageInvoicePage);
  final _mgmtService = NavigationService.instance
      .retrieveScope(Routes.manageInvoicePage)
      .resolve<InvoiceManagementService>();
  InvoiceCompletePageState() : super();
  double get totalAmount => this._mgmtService.totalAmount;
  void back() {
    this._scopedNavigator.pop();
  }

  void done() {
    this._rootNavigator.pop();
  }
}
