import 'package:floater/floater.dart';
import 'package:flutter/material.dart';
import 'package:store_management/sdk/proxies/invoice/invoice.dart';
import 'package:store_management/sdk/services/invoices_service.dart';
import 'total_sales_page.dart';

class TotalSalesPageState extends WidgetStateBase<TotalSalesPage> {
  final _navigator = NavigationService.instance.retrieveNavigator("/");
  final _invoicesService = ServiceLocator.instance.resolve<InvoicesService>();
  List<Invoice>? invoices;
  Invoice? _invoice;
  double get totalAmount => this._invoice?.totalAmount ?? 0;
  double get totalAmountWithTax => this._invoice?.totalTax ?? 0;
  double _totalSale = 0;
  double _totalTax = 0;
  double get totalSale => double.parse(this._totalSale.toStringAsFixed(2));
  double get totalTax => double.parse(this._totalTax.toStringAsFixed(2));
  double get totalRevenue =>
      double.parse((this.totalSale - this.totalTax).toStringAsFixed(2));
  TotalSalesPageState() : super() {
    this.onInitState(() {
      this._init();
    });
  }

  void back() {
    this._navigator.pop();
  }

  Future<void> _init() async {
    try {
      this.invoices = await this._invoicesService.getAllInvoices();
    } catch (e) {
      debugPrint(e.toString());
      this._navigator.pop();
    }
    this._totalSale = this._calcTotalSale();
    this._totalTax = this._calcTotalTax();
    this.triggerStateChange();
  }

  double _calcTotalSale() {
    var totalSale = 0.0;
    for (var i = 0; i < this.invoices!.length; i++) {
      final invoice = this.invoices![i];
      totalSale = totalSale + invoice.totalAmount;
    }
    return totalSale;
  }

  double _calcTotalTax() {
    var totalTax = 0.0;
    for (var i = 0; i < this.invoices!.length; i++) {
      final invoice = this.invoices![i];
      totalTax = totalTax + invoice.totalTax;
    }
    return totalTax;
  }
}
