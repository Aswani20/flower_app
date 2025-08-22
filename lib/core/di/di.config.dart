// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../project_layers/api_layer/api_client/api_client.dart' as _i778;
import '../../project_layers/api_layer/data_sources/auth_remote_data_source_impl.dart'
    as _i871;
import '../../project_layers/data_layer/data_source/auth_remote_data_source.dart'
    as _i956;
import '../../project_layers/data_layer/repositories/auth_repo_impl.dart'
    as _i511;
import '../../project_layers/domain_layer/repositories/auth_repo.dart' as _i777;
import '../../project_layers/domain_layer/use_cases/forget_password_use_case.dart'
    as _i18;
import '../../project_layers/domain_layer/use_cases/reset_password_use_case.dart'
    as _i194;
import '../../project_layers/domain_layer/use_cases/verify_reset_code_use_case.dart'
    as _i649;
import 'modules/dio_module.dart' as _i983;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.singleton<_i778.ApiClient>(() => _i778.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i956.AuthRemoteDataSource>(
      () => _i871.AuthRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i777.AuthRepo>(
      () => _i511.AuthRepoImpl(gh<_i956.AuthRemoteDataSource>()),
    );
    gh.factory<_i194.ResetPasswordUseCase>(
      () => _i194.ResetPasswordUseCase(gh<_i777.AuthRepo>()),
    );
    gh.factory<_i649.VerifyResetCodeUseCase>(
      () => _i649.VerifyResetCodeUseCase(gh<_i777.AuthRepo>()),
    );
    gh.factory<_i18.ForgetPasswordUseCase>(
      () => _i18.ForgetPasswordUseCase(gh<_i777.AuthRepo>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
