import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/invoice/invoice.dart';
import 'package:store_management/pages/splash/splash_page.dart';
import 'package:store_management/pages/view_invoice/view_invoice_page.dart';
import 'home/home_page.dart';
import 'manage_invoice/invoice_complete_page/invoice_complete_page.dart';
import 'manage_invoice/manage_invoice_page/manage_invoice_page.dart';
import 'receive_input/receive_input_page.dart';
import 'total_sales_page/total_sales_page.dart';

abstract class Routes {
  static const splash = "/splash";
  static const home = "/home";
  static const manageInvoicePage = "/manageInvoice";
  static const createInvoicePage = "/manageInvoice/invoice";
  static const receiveInputPage = '/manageInvoice/receiveInputPage';
  static const invoiceCompletePage = '/manageInvoice/invoiceComplete';
  static const totalSales = '/totalSales';
  static const viewInvoices = '/viewInvoices';

  static void initializeNavigation() {
    NavigationManager.instance.registerPage(
      Routes.splash,
      (routeArgs) => SplashPage(),
    );
    NavigationManager.instance
      ..registerPage(
        Routes.home,
        (routeArgs) => HomePage(),
      )
      ..registerPage(
        Routes.createInvoicePage,
        (routeArgs) => InvoicePage(),
      )
      ..registerPage(
        Routes.manageInvoicePage,
        (routeArgs) => ManageInvoicePage(),
      )
      ..registerPage(
        Routes.receiveInputPage,
        (routeArgs) => ReceiveInputPage(),
      )
      ..registerPage(
        Routes.invoiceCompletePage,
        (routeArgs) => InvoiceCompletePage(),
      )
      ..registerPage(
        Routes.totalSales,
        (routeArgs) => TotalSalesPage(),
      )
      ..registerPage(
        Routes.viewInvoices,
        (routeArgs) => ViewInvoicePage(),
      );

    NavigationManager.instance.bootstrap();
  }
}
