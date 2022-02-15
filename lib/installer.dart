import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/service/invoice_management_service.dart';
import 'package:store_management/sdk/services/invoices_service.dart';
import 'package:store_management/sdk/services/mock_invoices_service.dart';

class Installer extends ServiceInstaller {
  @override
  void install(ServiceRegistry registry) {
    registry
      ..registerSingleton<InvoicesService>(MockInvoicesService.new)
      ..registerScoped<InvoiceManagementService>(
        InvoiceManagementService.new,
      );
  }
}
