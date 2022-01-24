import 'dart:ffi';
import 'package:floater/floater.dart';
import 'package:store_management/service/invoice_management_service.dart';

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

  late Double _quantity;
  Double get quantity => this._quantity;
  set quantity(Double value) => (this.._quantity = value).triggerStateChange();

  late Double _mrp;
  Double get mrp => this._mrp;
  set mrp(Double value) => (this.._mrp = value).triggerStateChange();

  late Validator<ReceiveInputPageState> _validatorForProductName;
  bool get hasErrorsForProductName => this._validatorForProductName.hasErrors;
  ValidationErrors get errorsForProductName =>
      this._validatorForProductName.errors;

  late Validator<ReceiveInputPageState> _validatorForQuantity;
  bool get hasErrorsForQuantity => this._validatorForQuantity.hasErrors;
  ValidationErrors get errorsForQuantity => this._validatorForQuantity.errors;

  late Validator<ReceiveInputPageState> _validatorForMRP;
  bool get hasErrorsForMRP => this._validatorForMRP.hasErrors;
  ValidationErrors get errorsForMRP => this._validatorForMRP.errors;
  // bool get isNewLineItem => this._lineItemManagementService.isNewLineItem;

  ReceiveInputPageState() : super() {
    this._productName = _lineItem.productName!;
    this._createValidatorForProductName();
    this.onStateChange(() {
      this._validate();
    });
    this._quantity = _lineItem.quantity as Double;
    this._createValidatorForQuantity();
    this.onStateChange(() {
      this._validate();
    });
    this._mrp = _lineItem.mrp as Double;
    this._createValidatorForMRP();
    this.onStateChange(() {
      this._validate();
    });
  }

  void back() {
    this._navigator.pop();
  }

  void submit() {
    this._validatorForProductName.enable();
    this._validatorForQuantity.enable();
    this._validatorForMRP.enable();
    if (!this._validate()) {
      this.triggerStateChange();
      return;
    }

    // this._lineItem.productName(this._productName);
    // this._scopedNavigator.pushNamed(Routes.manageTodoDescription);
  }

  bool _validate() {
    this._validatorForProductName.validate(this);
    this._validatorForQuantity.validate(this);
    this._validatorForMRP.validate(this);
    return (this._validatorForProductName.isValid &&
        this._validatorForQuantity.isValid &&
        this._validatorForMRP.isValid);
  }

  void _createValidatorForProductName() {
    this._validatorForProductName = Validator(disabled: true);

    this
        ._validatorForProductName
        .prop("Product name", (t) => t.productName)
        .isRequired()
        .withMessage(message: "Product name required");
  }

  void _createValidatorForQuantity() {
    this._validatorForQuantity = Validator(disabled: true);

    this
        ._validatorForQuantity
        .prop("quantity", (t) => t.quantity)
        .isRequired()
        .withMessage(message: "Quantity name required");
  }

  void _createValidatorForMRP() {
    this._validatorForMRP = Validator(disabled: true);

    this
        ._validatorForMRP
        .prop("MRP", (t) => t.mrp)
        .isRequired()
        .withMessage(message: "MRP required");
  }
}
