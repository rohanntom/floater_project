import 'package:floater/floater.dart';
import 'package:store_management/sdk/proxies/mock_invoices_proxy.dart';
import 'package:store_management/sdk/services/invoice_service.dart';
import 'package:store_management/sdk/services/mock_invoice_service.dart';
import 'package:store_management/service/invoice_management_service.dart';

class Installer extends ServiceInstaller {
  @override
  void install(ServiceRegistry registry) {
    registry.registerSingleton<InvoiceService>(() => MockInvoiceService());

    registry.registerScoped<InvoiceManagementService>(
        () => InvoiceManagementService());
  }
}
