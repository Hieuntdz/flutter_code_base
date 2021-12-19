import 'package:flutter_code_base/core/services/api_provider.dart';
import 'package:flutter_code_base/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

class RepositoryDI {
  RepositoryDI._();

  static Future<void> init(GetIt injector) async {
    ApiProviderRepositoryImpl apiImpl = ApiProviderRepositoryImpl();

    injector.registerSingleton<AuthRepository>(
      AuthRepository(apiImpl),
    );
  }
}
