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
import '../../project_layers/api_layer/data_source_impl/category_remote_data_source_impl.dart'
    as _i962;
import '../../project_layers/api_layer/data_source_impl/product_remote_data_source_impl.dart'
    as _i789;
import '../../project_layers/data_layer/data_source/category_remote_data_source.dart'
    as _i956;
import '../../project_layers/data_layer/data_source/product_remote_data_source.dart'
    as _i27;
import '../../project_layers/data_layer/repo_impl/category_repo_impl.dart'
    as _i9;
import '../../project_layers/data_layer/repo_impl/product_repo_impl.dart'
    as _i663;
import '../../project_layers/domain_layer/repo/category_repo.dart' as _i294;
import '../../project_layers/domain_layer/repo/product_repo.dart' as _i249;
import '../../project_layers/domain_layer/usecase/category_use_case.dart'
    as _i417;
import '../../project_layers/domain_layer/usecase/product_use_case.dart'
    as _i836;
import '../../project_layers/presentation_layer/home/Tabs/category_tab/cubit/category_cubit.dart'
    as _i837;
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
    gh.factory<_i956.CategoryRemoteDataSource>(
      () => _i962.CategoryRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i27.ProductRemoteDataSource>(
      () => _i789.ProductRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i294.CategoryRepo>(
      () => _i9.CategoryRepoImpl(gh<_i956.CategoryRemoteDataSource>()),
    );
    gh.factory<_i249.ProductRepo>(
      () => _i663.ProductRepoImpl(gh<_i27.ProductRemoteDataSource>()),
    );
    gh.factory<_i417.CategoryUseCase>(
      () => _i417.CategoryUseCase(gh<_i294.CategoryRepo>()),
    );
    gh.factory<_i836.ProductUseCase>(
      () => _i836.ProductUseCase(gh<_i249.ProductRepo>()),
    );
    gh.factory<_i837.CategoryCubit>(
      () => _i837.CategoryCubit(
        gh<_i417.CategoryUseCase>(),
        gh<_i836.ProductUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
