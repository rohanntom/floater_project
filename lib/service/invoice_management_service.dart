import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/invoice.dart';
import 'package:store_management/sdk/proxies/lineItem.dart';
import 'package:store_management/sdk/services/invoice_service.dart';

class TodoManagementService {
  final _todosService = ServiceLocator.instance.resolve<InvoiceService>();

  Invoice? _invoice;

  DateTime? _date;
  DateTime? get date => this._date;

  late List<LineItem> _lineItems;
  List<LineItem> get lineItems => this._lineItems;

  // Future<void> init(String? id) async {
  //   if (id != null) this._todo = await this._todosService.get(id);
  //   this._date = this._todo?.title;
  //   this._lineItems = this._todo?.description;
  // }

  Future<void> complete() async {
    given(this, "this").ensure((t) => t._date != null);
    await this._todosService.createInvoice(this._date!, this._lineItems);
    return;
  }
}
