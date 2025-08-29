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
import '../../project_layers/api_layer/data_source/auth_remote_data_source_impl.dart'
    as _i185;
import '../../project_layers/api_layer/data_source/login_data_source_impl.dart'
    as _i576;
import '../../project_layers/api_layer/data_source/sign_up_remote_data_source_impl.dart'
    as _i477;
import '../../project_layers/data_layer/data_source/auth_remote_data_source.dart'
    as _i956;
import '../../project_layers/data_layer/data_source/login_data_source.dart'
    as _i196;
import '../../project_layers/data_layer/data_source/sign_up_remote_data_source.dart'
    as _i772;
import '../../project_layers/data_layer/repos_impl/auth_repo_impl.dart'
    as _i253;
import '../../project_layers/data_layer/repos_impl/login_repo_impl.dart'
    as _i674;
import '../../project_layers/data_layer/repos_impl/sign_up_repo_impl.dart'
    as _i631;
import '../../project_layers/domain_layer/repos/auth_repo.dart' as _i326;
import '../../project_layers/domain_layer/repos/login_repo.dart' as _i974;
import '../../project_layers/domain_layer/repos/sign_up_repo.dart' as _i948;
import '../../project_layers/domain_layer/use_cases/forget_password_use_case.dart'
    as _i18;
import '../../project_layers/domain_layer/use_cases/login_usecase.dart'
    as _i1027;
import '../../project_layers/domain_layer/use_cases/reset_password_use_case.dart'
    as _i194;
import '../../project_layers/domain_layer/use_cases/sign_up_use_case.dart'
    as _i123;
import '../../project_layers/domain_layer/use_cases/verify_reset_code_use_case.dart'
    as _i649;
import '../../project_layers/presentaion_layer/auth/forget_password/cubit/forget_password_view_model.dart'
    as _i469;
import '../../project_layers/presentaion_layer/auth/sign_in/cubit/login_cubit.dart'
    as _i498;
import '../../project_layers/presentaion_layer/auth/sign_up/cubit/sign_up_cubit.dart'
    as _i785;
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
    gh.factory<_i772.SignUpRemoteDataSource>(
      () => _i477.SignUpRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i196.LoginDataSource>(
      () => _i576.LoginDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i956.AuthRemoteDataSource>(
      () => _i185.AuthRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i948.SignUpRepo>(
      () => _i631.SignUpRepoImpl(gh<_i772.SignUpRemoteDataSource>()),
    );
    gh.factory<_i326.AuthRepo>(
      () => _i253.AuthRepoImpl(gh<_i956.AuthRemoteDataSource>()),
    );
    gh.factory<_i974.LoginRepository>(
      () => _i674.LoginRepositoryImpl(gh<_i196.LoginDataSource>()),
    );
    gh.factory<_i123.SignUpUseCase>(
      () => _i123.SignUpUseCase(gh<_i948.SignUpRepo>()),
    );
    gh.factory<_i1027.LoginUseCase>(
      () => _i1027.LoginUseCase(loginRepository: gh<_i974.LoginRepository>()),
    );
    gh.factory<_i194.ResetPasswordUseCase>(
      () => _i194.ResetPasswordUseCase(gh<_i326.AuthRepo>()),
    );
    gh.factory<_i649.VerifyResetCodeUseCase>(
      () => _i649.VerifyResetCodeUseCase(gh<_i326.AuthRepo>()),
    );
    gh.factory<_i18.ForgetPasswordUseCase>(
      () => _i18.ForgetPasswordUseCase(gh<_i326.AuthRepo>()),
    );
    gh.factory<_i785.SignUpCubit>(
      () => _i785.SignUpCubit(gh<_i123.SignUpUseCase>()),
    );
    gh.factory<_i498.LoginCubit>(
      () => _i498.LoginCubit(loginUseCase: gh<_i1027.LoginUseCase>()),
    );
    gh.factory<_i469.ForgetPasswordViewModel>(
      () => _i469.ForgetPasswordViewModel(
        forgetPasswordUseCase: gh<_i18.ForgetPasswordUseCase>(),
        verifyResetCodeUseCase: gh<_i649.VerifyResetCodeUseCase>(),
        resetPasswordUseCase: gh<_i194.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
