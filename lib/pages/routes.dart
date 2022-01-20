import 'package:floater/floater.dart';
import 'package:store_management/pages/splash/splash_page.dart';
import 'package:store_management/pages/view_all_invoices/view_all_invoices_page.dart';

import 'home/home_page.dart';
import 'invoice/invoice.dart';
import 'invoice_complete_page/invoice_complete_page.dart';
import 'manage_invoice/manage_invoice_page.dart';
import 'receive_input/receive_input_page.dart';
import 'total_sales_page/total_sales_page.dart';

abstract class Routes {
  static const splash = "/splash";
  static const home = "/home";

  static const createInvoicePage = "/invoice";
  static const manageInvoicePage = "/manageInvoice";
  static const receiveInputPage = '/receiveInput';
  static const invoiceCompletePage = '/invoiceComplete';
  static const totalSales = '/totalSales';
  static const viewInvoices = '/viewInvoices';

  // static const viewTodo = "$home/viewTodo?{id: string}";

  // Call this function in main.dart to register all the app pages
  // and bootstrap the navigation
  static void initializeNavigation() {
    // registering app pages here.
    // root nav pages

    NavigationManager.instance
        .registerPage(Routes.splash, (routeArgs) => SplashPage());
    NavigationManager.instance
      ..registerPage(Routes.home, (routeArgs) => HomePage())
      ..registerPage(Routes.createInvoicePage, (routeArgs) => InvoicePage())
      ..registerPage(
          Routes.manageInvoicePage, (routeArgs) => ManageInvoicePage())
      ..registerPage(Routes.receiveInputPage, (routeArgs) => ReceiveInputPage())
      ..registerPage(
          Routes.invoiceCompletePage, (routeArgs) => InvoiceCompletePage())
      ..registerPage(Routes.totalSales, (routeArgs) => TotalSalesPage())
      ..registerPage(Routes.viewInvoices, (routeArgs) => ViewAllInvoicesPage());

    //   ..registerPage(
    //     Routes.viewTodo,
    //     (routeArgs) => ViewTodoPage(routeArgs["id"]),
    //     fullscreenDialog: false,
    //     pageType: PageType.custom,
    //     customPageRouteBuilder: CustomPageRouteBuilder(
    //       opaque: false,
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         final tween = Tween(begin: 0.0, end: 1.0);
    //         final fadeAnimation = animation.drive(tween);
    //         return FadeTransition(
    //           opacity: fadeAnimation,
    //           child: child,
    //         );
    //       },
    //     ),
    //   );
    // ..registerPage(
    //     Routes.viewTodo, (routeArgs) => ViewTodoPage(routeArgs["id"]));

    // bootstrapping Navigation
    NavigationManager.instance.bootstrap();
  }
}
