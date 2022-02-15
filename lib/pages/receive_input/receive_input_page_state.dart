import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/service/invoice_management_service.dart';
import '../routes.dart';
import 'receive_input_page.dart';

class ReceiveInputPageState extends WidgetStateBase<ReceiveInputPage> {
  final _mgmtService = NavigationService.instance
      .retrieveScope(Routes.manageInvoicePage)
      .resolve<InvoiceManagementService>();
  final _navigator =
      NavigationService.instance.retrieveNavigator(Routes.manageInvoicePage);

  String _productName = "";
  String get productName => this._productName;
  set productName(String value) =>
      (this.._productName = value).triggerStateChange();

  double _quantity = 0;
  double get quantity => this._quantity;
  set quantity(double value) => (this.._quantity = value).triggerStateChange();

  double _mrp = 0;
  double get mrp => this._mrp;
  set mrp(double value) => (this.._mrp = value).triggerStateChange();

  late final Validator<ReceiveInputPageState> _validator =
      this._createValidator();
  bool get hasErrors => this._validator.hasErrors;
  ValidationErrors get errors => this._validator.errors;

  ReceiveInputPageState() : super() {
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
    this._mgmtService.addItem(this._productName, this._quantity, this._mrp);
    this.triggerStateChange();
    this._navigator.pop();
  }

  bool _validate() {
    this._validator.validate(this);
    // print(_validator.errors);
    return this._validator.isValid;
  }

  Validator<ReceiveInputPageState> _createValidator() {
    final validator = Validator<ReceiveInputPageState>(disabled: true);

    validator
        .prop("productName", (t) => t.productName)
        .isRequired()
        .withMessage(message: "Product name required");
    validator
        .prop("quantity", (t) => t.quantity)
        .isRequired()
        .withMessage(message: "Quantity required")
        .hasMinValue(1);
    validator
        .prop("mrp", (t) => t.mrp)
        .isRequired()
        .withMessage(message: "MRP required")
        .hasMinValue(0.01);
    return validator;
  }
}
