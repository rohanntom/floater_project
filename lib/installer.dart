import 'package:floater/floater.dart';
import 'package:store_management/sdk/service/lineItem_management_service.dart';
import 'package:store_management/sdk/service/lineItem_service.dart';

import 'sdk/service/mock_lineItem_service.dart';

class Installer extends ServiceInstaller {
  @override
  void install(ServiceRegistry registry) {
    // Network Services
    // you can change the MockTodoService with RemoteTodoService (which makes the call to an api) without changing any part of your code.
    // it is a Singleton, so there will be only one instance of TodoService through out the lifecycle if the app.
    registry.registerSingleton<LineItemService>(() => MockLineItemService());

    // ui Services
    // services that facilitate clean communication between pages and/or widgets
    // these services are usually scoped
    registry.registerScoped<LineItemManagementService>(
        () => LineItemManagementService());
  }
}
