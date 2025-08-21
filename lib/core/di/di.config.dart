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

import '../../project_layers/api_layer/client/api_client/api_client.dart'
    as _i423;
import '../../project_layers/api_layer/data_sources_impl/sign_up_remote_data_source_impl.dart'
    as _i719;
import '../../project_layers/data_layer/data_source/sign_up_remote_data_source.dart'
    as _i772;
import '../../project_layers/data_layer/repos_impl/sign_up_repo_impl.dart'
    as _i631;
import '../../project_layers/domain_layer/repos/sign_up_repo.dart' as _i948;
import '../../project_layers/domain_layer/usecase/sign_up_use_case.dart'
    as _i1065;
import '../../project_layers/presentation_layer/sign_up/cubit/sign_up_cubit.dart'
    as _i987;
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
    gh.singleton<_i423.ApiClient>(() => _i423.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i772.SignUpRemoteDataSource>(
      () => _i719.SignUpRemoteDataSourceImpl(gh<_i423.ApiClient>()),
    );
    gh.factory<_i948.SignUpRepo>(
      () => _i631.SignUpRepoImpl(gh<_i772.SignUpRemoteDataSource>()),
    );
    gh.factory<_i1065.SignUpUseCase>(
      () => _i1065.SignUpUseCase(gh<_i948.SignUpRepo>()),
    );
    gh.factory<_i987.SignUpCubit>(
      () => _i987.SignUpCubit(gh<_i1065.SignUpUseCase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
