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
import '../../project_layers/api_layer/data_source/login_data_source/login_data_source_impl.dart'
    as _i465;
import '../../project_layers/data_layer/data_source/login_data_source/login_data_source.dart'
    as _i911;
import '../../project_layers/data_layer/repos_impl/login_repo/login_repo_impl.dart'
    as _i765;
import '../../project_layers/domain_layer/repos/login_repo/login_repo.dart'
    as _i450;
import '../../project_layers/domain_layer/usecase/login_usecase/login_usecase.dart'
    as _i529;
import '../../project_layers/presentaion_layer/cubit/login_cubit.dart' as _i97;
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
    gh.factory<_i911.LoginDataSource>(
      () => _i465.LoginDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i450.LoginRepository>(
      () => _i765.LoginRepositoryImpl(gh<_i911.LoginDataSource>()),
    );
    gh.factory<_i529.LoginUseCase>(
      () => _i529.LoginUseCase(loginRepository: gh<_i450.LoginRepository>()),
    );
    gh.factory<_i97.LoginCubit>(
      () => _i97.LoginCubit(loginUseCase: gh<_i529.LoginUseCase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
