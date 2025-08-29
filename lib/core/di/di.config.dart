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
import '../../project_layers/api_layer/data_source/home_data_source_impl.dart'
    as _i329;
import '../../project_layers/data_layer/data_source/home_remote_data_spurce.dart'
    as _i1054;
import '../../project_layers/data_layer/repositories/home_repo_impl.dart'
    as _i84;
import '../../project_layers/domain_layer/repositories/home_repo.dart' as _i401;
import '../../project_layers/domain_layer/use_cases/home/best_seller_use_case.dart'
    as _i990;
import '../../project_layers/domain_layer/use_cases/home/category_use_case.dart'
    as _i858;
import '../../project_layers/domain_layer/use_cases/home/occaison_use_case.dart'
    as _i7;
import '../../project_layers/presentation_layer/home/Tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i536;
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
    gh.factory<_i1054.HomeRemoteDataSource>(
      () => _i329.HomeRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i401.HomeRepo>(
      () => _i84.HomeRepoImpl(gh<_i1054.HomeRemoteDataSource>()),
    );
    gh.factory<_i990.BestSellerUseCase>(
      () => _i990.BestSellerUseCase(homeRepo: gh<_i401.HomeRepo>()),
    );
    gh.factory<_i858.CategoryUseCase>(
      () => _i858.CategoryUseCase(homeRepo: gh<_i401.HomeRepo>()),
    );
    gh.factory<_i7.OccasionUseCase>(
      () => _i7.OccasionUseCase(homeRepo: gh<_i401.HomeRepo>()),
    );
    gh.factory<_i536.HomeTabViewModel>(
      () => _i536.HomeTabViewModel(
        categoryUseCase: gh<_i858.CategoryUseCase>(),
        bestSellerUseCase: gh<_i990.BestSellerUseCase>(),
        occasionUseCase: gh<_i7.OccasionUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
