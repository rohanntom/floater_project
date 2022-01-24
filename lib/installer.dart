import 'package:floater/floater.dart';
import 'package:store_management/pages/manage_invoice/service/invoice_management_service.dart';
import 'package:store_management/sdk/services/invoice_service.dart';
import 'package:store_management/sdk/services/mock_invoice_service.dart';

class Installer extends ServiceInstaller {
  @override
  void install(ServiceRegistry registry) {
    registry
      ..registerSingleton<InvoiceService>(MockInvoiceService.new)
      ..registerScoped<InvoiceManagementService>(
        InvoiceManagementService.new,
      );
  }
}
