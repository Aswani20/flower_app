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
import '../../project_layers/api_layer/data_source/occasions_data_source_impl.dart'
    as _i246;
import '../../project_layers/api_layer/data_source/product_data_source_impl.dart'
    as _i342;
import '../../project_layers/data_layer/data_source/occasions_data_source.dart'
    as _i585;
import '../../project_layers/data_layer/data_source/product_data_source.dart'
    as _i1029;
import '../../project_layers/data_layer/repo/occasions_repo_impl.dart' as _i285;
import '../../project_layers/data_layer/repo/product_repo_impl.dart' as _i683;
import '../../project_layers/domain_layer/repo/occasion_repo.dart' as _i628;
import '../../project_layers/domain_layer/repo/product_repo.dart' as _i249;
import '../../project_layers/domain_layer/usecase/occasion_usecase.dart'
    as _i268;
import '../../project_layers/domain_layer/usecase/product_usecase.dart' as _i14;
import '../../project_layers/presentation_layer/occasion/view_model/occasion_cubit.dart'
    as _i1000;
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
    gh.factory<_i1029.ProductDataSource>(
      () => _i342.ProductDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i585.OccasionsDataSource>(
      () => _i246.OccasionsDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i628.OccasionRepo>(
      () => _i285.OccasionsRepoImpl(gh<_i585.OccasionsDataSource>()),
    );
    gh.factory<_i268.OccasionUseCase>(
      () => _i268.OccasionUseCase(gh<_i628.OccasionRepo>()),
    );
    gh.factory<_i249.ProductRepo>(
      () => _i683.ProductRepoImpl(gh<_i1029.ProductDataSource>()),
    );
    gh.factory<_i14.ProductUseCase>(
      () => _i14.ProductUseCase(gh<_i249.ProductRepo>()),
    );
    gh.factory<_i1000.OccasionCubit>(
      () => _i1000.OccasionCubit(
        gh<_i268.OccasionUseCase>(),
        gh<_i14.ProductUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
