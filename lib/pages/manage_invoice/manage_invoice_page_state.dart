import 'package:floater/floater.dart';
import 'manage_invoice_page.dart';

class ManageInvoicePageState extends WidgetStateBase<ManageInvoicePage> {
  final ServiceLocator _scope = ServiceManager.instance.createScope();
  ServiceLocator get scope => this._scope;

  bool _isServiceInitialized = false;
  bool get isServiceInitialized => this._isServiceInitialized;
  set isServiceInitialized(bool value) =>
      (this.._isServiceInitialized = value).triggerStateChange();

  ManageInvoicePageState() : super();
}
