import 'package:floater/floater.dart';
import 'package:store_management/sdk/models/lineItem.dart';
import 'package:store_management/sdk/proxies/invoice/invoice_dto.dart';
import 'total_sales_page.dart';
// import 'package:store_management/sdk/services/invoices_service.dart';
// import 'package:store_management/sdk/proxies/invoice/invoice.dart';

class TotalSalesPageState extends WidgetStateBase<TotalSalesPage> {
  TotalSalesPageState() : super();
  final _navigator = NavigationService.instance.retrieveNavigator("/");
  // final _invoicesService = ServiceLocator.instance.resolve<InvoicesService>();

  InvoiceDto? _invoiceDto;
  List<LineItem> get lineItems => this._invoiceDto!.lineItems;
  // Future<List<Invoice>> get _allInvoices => this._invoicesService.getAllInvoices();

  void back() {
    this._navigator.pop();
  }

  // double calcTotalAmount() {
  //   var totalAmount = 0.0;
  //   for (var i = 0; i < this.lineItems.length; i++) {
  //     final lineItem = this.lineItems[i];
  //     totalAmount = totalAmount + lineItem.amount;
  //   }
  //   return totalAmount;
  // }

  // double calcTotalTax() {
  //   var totalAmountWithTax = 0.0;
  //   for (var i = 0; i < this.lineItems.length; i++) {
  //     final lineItem = this.lineItems[i];
  //     totalAmountWithTax = totalAmountWithTax + lineItem.amount;
  //   }
  //   return totalAmountWithTax;
  // }
}
