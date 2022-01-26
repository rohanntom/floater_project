import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/service/invoice_management_service.dart';

import '../routes.dart';
import 'receive_input_page.dart';

class ReceiveInputPageState extends WidgetStateBase<ReceiveInputPage> {
  final _lineItem = NavigationService.instance
      .retrieveScope(Routes.manageInvoicePage)
      .resolve<InvoiceManagementService>();
  final _navigator = NavigationService.instance.retrieveNavigator("/");

  late String _productName;
  String get productName => this._productName;
  set productName(String value) =>
      (this.._productName = value).triggerStateChange();

  late double _quantity;
  double get quantity => this._quantity;
  set quantity(double value) => (this.._quantity = value).triggerStateChange();

  late double _mrp;
  double get mrp => this._mrp;
  set mrp(double value) => (this.._mrp = value).triggerStateChange();

  late Validator<ReceiveInputPageState> _validator;
  bool get hasErrors => this._validator.hasErrors;
  ValidationErrors get errors => this._validator.errors;

  ReceiveInputPageState() : super() {
    this._productName = _lineItem.productName!;
    this._quantity = _lineItem.quantity!;
    this._mrp = _lineItem.mrp!;
    this._createValidator();
    this.onStateChange(() {
      this._validate();
    });
  }

  void back() {
    this._navigator.pop();
  }

  void submit() {
    this._validator.enable();
    if (!this._validate()) {
      this.triggerStateChange();
      return;
    }
    this._lineItem.addItem(this._productName, this._quantity, this._mrp);
    this._navigator.pop();
  }

  bool _validate() {
    this._validator.validate(this);
    return this._validator.isValid;
  }

  void _createValidator() {
    this._validator = Validator(disabled: true);

    this
        ._validator
        .prop("productName", (t) => t.productName)
        .isRequired()
        .withMessage(message: "Product name required");
    this
        ._validator
        .prop("quantity", (t) => t.quantity)
        .isRequired()
        .withMessage(message: "Quantity name required");
    this
        ._validator
        .prop("MRP", (t) => t.mrp)
        .isRequired()
        .withMessage(message: "MRP required");
  }
}
