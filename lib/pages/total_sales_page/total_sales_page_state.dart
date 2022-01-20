import 'package:floater/floater.dart';
import 'total_sales_page.dart';

class TotalSalesPageState extends WidgetStateBase<TotalSalesPage> {
  TotalSalesPageState() : super();
  final _navigator = NavigationService.instance.retrieveNavigator("/");
  void back() {
    this._navigator.pop();
  }
}
