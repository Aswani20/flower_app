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
import '../../project_layers/api_layer/data_source/best_seller_data_source_impl.dart'
    as _i561;
import '../../project_layers/data_layer/data_source/best_seller_data_source.dart'
    as _i1012;
import '../../project_layers/data_layer/repo/best_seller_repo_impl.dart'
    as _i895;
import '../../project_layers/domain_layer/repo/best_seller_repo.dart' as _i623;
import '../../project_layers/domain_layer/usecase/best_seller_usecase.dart'
    as _i1022;
import '../../project_layers/presentation_layer/best_seller/cubit/best_seller_cubit.dart'
    as _i734;
import '../../project_layers/presentation_layer/home/home_view_model.dart'
    as _i864;
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
    gh.factory<_i864.HomeViewModel>(() => _i864.HomeViewModel());
    gh.singleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.singleton<_i778.ApiClient>(() => _i778.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i1012.BestSellerDataSource>(
      () => _i561.BestSellerDataSourceImpl(apiClient: gh<_i778.ApiClient>()),
    );
    gh.factory<_i623.BestSellerRepo>(
      () => _i895.BestSellerRepoImpl(
        bestSellerDataSource: gh<_i1012.BestSellerDataSource>(),
      ),
    );
    gh.factory<_i1022.BestSellerUsecase>(
      () =>
          _i1022.BestSellerUsecase(bestSellerRepo: gh<_i623.BestSellerRepo>()),
    );
    gh.factory<_i734.BestSellerViewModel>(
      () => _i734.BestSellerViewModel(gh<_i1022.BestSellerUsecase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
