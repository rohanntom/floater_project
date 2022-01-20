import 'package:floater/floater.dart';

import '../routes.dart';
import 'home_page.dart';

class HomePageState extends WidgetStateBase<HomePage> {
  HomePageState() : super() {}
  final _navigator = NavigationService.instance.retrieveNavigator("/");
  void onClickCreateInvoice() {
    this._navigator.pushNamed(Routes.createInvoicePage);
  }

  void onClickTotalSales() {
    this._navigator.pushNamed(Routes.totalSales);
  }

  void onClickViewInvoices() {
    this._navigator.pushNamed(Routes.viewInvoices);
  }
}
