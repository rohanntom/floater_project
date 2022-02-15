import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/service/invoice_management_service.dart';
import 'package:store_management/sdk/models/line_item.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import '../../routes.dart';
import 'invoice_page.dart';

class InvoicePageState extends WidgetStateBase<InvoicePage> {
  final _rootNavigator = NavigationService.instance.retrieveNavigator("/");
  final _mgmtNavigator =
      NavigationService.instance.retrieveNavigator(Routes.manageInvoicePage);
  final _invoiceMgmtService = NavigationService.instance
      .retrieveScope(Routes.manageInvoicePage)
      .resolve<InvoiceManagementService>();

  late Invoice invoice;

  InvoicePageState() : super() {
    onInitState(() {
      this.init();
    });
  }

  Future<void> init() async {
    _invoiceMgmtService.addListener(listener);
    setState(() {});
  }

  void listener() {
    // print('${this._invoiceMgmtService.lineItems.length}');
    this.triggerStateChange();
  }

  void dispose() {
    _invoiceMgmtService.removeListener(listener);
    super.dispose();
  }

  List<LineItem> get lineItems => this._invoiceMgmtService.lineItems;
  double get totalAmount => this._invoiceMgmtService.totalAmount;

  void onConfirmedPressed() {
    this._mgmtNavigator.pushNamed(Routes.invoiceCompletePage);
  }

  void onClick() {
    this._mgmtNavigator.pushNamed(Routes.receiveInputPage);
  }

  void back() {
    this._rootNavigator.pop();
  }
}
