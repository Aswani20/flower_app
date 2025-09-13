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

import '../../project_layers/api_layer/api_client/api_client.dart' as _i778;
import '../../project_layers/api_layer/data_source/address_data_source_impl.dart'
    as _i1063;
import '../../project_layers/api_layer/data_source/auth_remote_data_source_impl.dart'
    as _i185;
import '../../project_layers/api_layer/data_source/best_seller_data_source_impl.dart'
    as _i561;
import '../../project_layers/api_layer/data_source/category_remote_data_source_impl.dart'
    as _i622;
import '../../project_layers/api_layer/data_source/change_password_remote_data_source_impl.dart'
    as _i658;
import '../../project_layers/api_layer/data_source/get_all_notification_remote_data_source_impl.dart'
    as _i118;
import '../../project_layers/api_layer/data_source/get_logged_user_data_source_impl.dart'
    as _i916;
import '../../project_layers/api_layer/data_source/home_data_source_impl.dart'
    as _i329;
import '../../project_layers/api_layer/data_source/login_data_source_impl.dart'
    as _i576;
import '../../project_layers/api_layer/data_source/occasions_data_source_impl.dart'
    as _i246;
import '../../project_layers/api_layer/data_source/orders_data_source_impl.dart'
    as _i364;
import '../../project_layers/api_layer/data_source/product_data_source_impl.dart'
    as _i342;
import '../../project_layers/api_layer/data_source/product_remote_data_source_impl.dart'
    as _i636;
import '../../project_layers/api_layer/data_source/sign_up_remote_data_source_impl.dart'
    as _i477;
import '../../project_layers/api_layer/data_source/update_user_profile_data_source_impl.dart'
    as _i197;
import '../../project_layers/data_layer/data_source/address_data_source.dart'
    as _i29;
import '../../project_layers/data_layer/data_source/auth_remote_data_source.dart'
    as _i956;
import '../../project_layers/data_layer/data_source/best_seller_data_source.dart'
    as _i1012;
import '../../project_layers/data_layer/data_source/category_remote_data_source.dart'
    as _i956;
import '../../project_layers/data_layer/data_source/change_password_remote_data_source.dart'
    as _i100;
import '../../project_layers/data_layer/data_source/get_all_notification_remote_data_source.dart'
    as _i680;
import '../../project_layers/data_layer/data_source/get_logget_user_data_source.dart'
    as _i455;
import '../../project_layers/data_layer/data_source/home_remote_data_spurce.dart'
    as _i1054;
import '../../project_layers/data_layer/data_source/login_data_source.dart'
    as _i196;
import '../../project_layers/data_layer/data_source/occasions_data_source.dart'
    as _i585;
import '../../project_layers/data_layer/data_source/orders_data_source.dart'
    as _i916;
import '../../project_layers/data_layer/data_source/product_data_source.dart'
    as _i1029;
import '../../project_layers/data_layer/data_source/product_remote_data_source.dart'
    as _i27;
import '../../project_layers/data_layer/data_source/profile_repo_data_source.dart'
    as _i464;
import '../../project_layers/data_layer/data_source/sign_up_remote_data_source.dart'
    as _i772;
import '../../project_layers/data_layer/repo/occasions_repo_impl.dart' as _i285;
import '../../project_layers/data_layer/repo/product_repo_impl.dart' as _i683;
import '../../project_layers/data_layer/repos_impl/address_repo_impl.dart'
    as _i973;
import '../../project_layers/data_layer/repos_impl/auth_repo_impl.dart'
    as _i253;
import '../../project_layers/data_layer/repos_impl/best_seller_repo_impl.dart'
    as _i673;
import '../../project_layers/data_layer/repos_impl/category_repo_impl.dart'
    as _i425;
import '../../project_layers/data_layer/repos_impl/chang_password_repo_impl.dart'
    as _i952;
import '../../project_layers/data_layer/repos_impl/get_all_notification_repo_impl.dart'
    as _i805;
import '../../project_layers/data_layer/repos_impl/get_logged_user_data_repo_impl.dart'
    as _i340;
import '../../project_layers/data_layer/repos_impl/home_repo_impl.dart'
    as _i157;
import '../../project_layers/data_layer/repos_impl/login_repo_impl.dart'
    as _i674;
import '../../project_layers/data_layer/repos_impl/orders_repo_impl.dart'
    as _i811;
import '../../project_layers/data_layer/repos_impl/product_repo_impl.dart'
    as _i146;
import '../../project_layers/data_layer/repos_impl/profile_repo_impl.dart'
    as _i463;
import '../../project_layers/data_layer/repos_impl/sign_up_repo_impl.dart'
    as _i631;
import '../../project_layers/domain_layer/repo/occasion_repo.dart' as _i628;
import '../../project_layers/domain_layer/repo/product_repo.dart' as _i249;
import '../../project_layers/domain_layer/repos/address_repo.dart' as _i1;
import '../../project_layers/domain_layer/repos/auth_repo.dart' as _i326;
import '../../project_layers/domain_layer/repos/best_seller_repo.dart' as _i408;
import '../../project_layers/domain_layer/repos/category_repo.dart' as _i144;
import '../../project_layers/domain_layer/repos/chang_password_repo.dart'
    as _i64;
import '../../project_layers/domain_layer/repos/get_all_notification_repo.dart'
    as _i570;
import '../../project_layers/domain_layer/repos/get_logged_user_data_repo.dart'
    as _i105;
import '../../project_layers/domain_layer/repos/home_repo.dart' as _i900;
import '../../project_layers/domain_layer/repos/login_repo.dart' as _i974;
import '../../project_layers/domain_layer/repos/orders_repo.dart' as _i395;
import '../../project_layers/domain_layer/repos/product_repo.dart' as _i53;
import '../../project_layers/domain_layer/repos/profile_repo.dart' as _i583;
import '../../project_layers/domain_layer/repos/sign_up_repo.dart' as _i948;
import '../../project_layers/domain_layer/use_cases/add_address_use_case.dart'
    as _i366;
import '../../project_layers/domain_layer/use_cases/best_seller_use_case.dart'
    as _i124;
import '../../project_layers/domain_layer/use_cases/category_use_case.dart'
    as _i878;
import '../../project_layers/domain_layer/use_cases/change_password_use_case.dart'
    as _i503;
import '../../project_layers/domain_layer/use_cases/forget_password_use_case.dart'
    as _i18;
import '../../project_layers/domain_layer/use_cases/get_address_use_case.dart'
    as _i294;
import '../../project_layers/domain_layer/use_cases/get_all_notification_use_case.dart'
    as _i982;
import '../../project_layers/domain_layer/use_cases/get_logged_user_data_use_case.dart'
    as _i323;
import '../../project_layers/domain_layer/use_cases/home/best_seller_use_case.dart'
    as _i990;
import '../../project_layers/domain_layer/use_cases/home/category_use_case.dart'
    as _i858;
import '../../project_layers/domain_layer/use_cases/home/occaison_use_case.dart'
    as _i7;
import '../../project_layers/domain_layer/use_cases/login_usecase.dart'
    as _i1027;
import '../../project_layers/domain_layer/use_cases/orders_use_case.dart'
    as _i389;
import '../../project_layers/domain_layer/use_cases/product_use_case.dart'
    as _i608;
import '../../project_layers/domain_layer/use_cases/reset_password_use_case.dart'
    as _i194;
import '../../project_layers/domain_layer/use_cases/sign_up_use_case.dart'
    as _i123;
import '../../project_layers/domain_layer/use_cases/update_user_photo_use_case.dart'
    as _i797;
import '../../project_layers/domain_layer/use_cases/update_user_profile_use_case.dart'
    as _i621;
import '../../project_layers/domain_layer/use_cases/verify_reset_code_use_case.dart'
    as _i649;
import '../../project_layers/domain_layer/usecase/occasion_usecase.dart'
    as _i268;
import '../../project_layers/domain_layer/usecase/product_usecase.dart' as _i14;
import '../../project_layers/presentaion_layer/addresses/add_address/cubit/add_address_cubit.dart'
    as _i860;
import '../../project_layers/presentaion_layer/addresses/saved_addresses/cubit/saved_address_cubit.dart'
    as _i122;
import '../../project_layers/presentaion_layer/auth/forget_password/cubit/forget_password_view_model.dart'
    as _i469;
import '../../project_layers/presentaion_layer/auth/sign_in/cubit/login_cubit.dart'
    as _i498;
import '../../project_layers/presentaion_layer/auth/sign_up/cubit/sign_up_cubit.dart'
    as _i785;
import '../../project_layers/presentaion_layer/best_seller/cubit/best_seller_cubit.dart'
    as _i125;
import '../../project_layers/presentaion_layer/home/Tabs/category_tab/cubit/category_cubit.dart'
    as _i608;
import '../../project_layers/presentaion_layer/home/Tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i661;
import '../../project_layers/presentaion_layer/home/Tabs/profile_tab/cubits/profile/profile_cubit.dart'
    as _i256;
import '../../project_layers/presentaion_layer/home/Tabs/profile_tab/cubits/reset/cubit/reset_password_cubit.dart'
    as _i143;
import '../../project_layers/presentaion_layer/notifications_list/cubit/notifications_list_cubit.dart'
    as _i718;
import '../../project_layers/presentaion_layer/orders/cubit/orders_cubit.dart'
    as _i665;
import '../../project_layers/presentation_layer/occasion/view_model/occasion_cubit.dart'
    as _i1000;
import 'modules/dio_module.dart' as _i983;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i528.PrettyDioLogger>()),
    );
    gh.singleton<_i778.ApiClient>(() => _i778.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i1054.HomeRemoteDataSource>(
      () => _i329.HomeRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i1012.BestSellerDataSource>(
      () => _i561.BestSellerDataSourceImpl(apiClient: gh<_i778.ApiClient>()),
    );
    gh.factory<_i100.ChangePasswordRemoteDataSource>(
      () => _i658.ChangePasswordRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i680.GetAllNotificationRemoteDataSource>(
      () => _i118.GetAllNotificationRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i29.AddressDataSource>(
      () => _i1063.AddAddressDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i1.AddressRepo>(
      () => _i973.AddressRepoImpl(gh<_i29.AddressDataSource>()),
    );
    gh.factory<_i464.ProfileRepoDataSource>(
      () => _i197.ProfileRepoDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i27.ProductRemoteDataSource>(
      () => _i636.ProductRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i1029.ProductDataSource>(
      () => _i342.ProductDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i583.ProfileRepo>(
      () => _i463.ProfileRepoImpl(gh<_i464.ProfileRepoDataSource>()),
    );
    gh.factory<_i772.SignUpRemoteDataSource>(
      () => _i477.SignUpRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i585.OccasionsDataSource>(
      () => _i246.OccasionsDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i455.GetLoggetUserDataSource>(
      () => _i916.GetLoggedUserDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i628.OccasionRepo>(
      () => _i285.OccasionsRepoImpl(gh<_i585.OccasionsDataSource>()),
    );
    gh.factory<_i196.LoginDataSource>(
      () => _i576.LoginDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i916.OrdersDataSource>(
      () => _i364.OrdersDataSourceImpl(apiClient: gh<_i778.ApiClient>()),
    );
    gh.factory<_i956.CategoryRemoteDataSource>(
      () => _i622.CategoryRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i366.AddAddressUseCase>(
      () => _i366.AddAddressUseCase(gh<_i1.AddressRepo>()),
    );
    gh.factory<_i294.GetAddressUseCase>(
      () => _i294.GetAddressUseCase(gh<_i1.AddressRepo>()),
    );
    gh.factory<_i408.BestSellerRepo>(
      () => _i673.BestSellerRepoImpl(
        bestSellerDataSource: gh<_i1012.BestSellerDataSource>(),
      ),
    );
    gh.factory<_i395.OrdersRepository>(
      () =>
          _i811.OrdersRepoImpl(ordersDataSource: gh<_i916.OrdersDataSource>()),
    );
    gh.factory<_i956.AuthRemoteDataSource>(
      () => _i185.AuthRemoteDataSourceImpl(gh<_i778.ApiClient>()),
    );
    gh.factory<_i860.AddAddressCubit>(
      () => _i860.AddAddressCubit(gh<_i366.AddAddressUseCase>()),
    );
    gh.factory<_i268.OccasionUseCase>(
      () => _i268.OccasionUseCase(gh<_i628.OccasionRepo>()),
    );
    gh.factory<_i948.SignUpRepo>(
      () => _i631.SignUpRepoImpl(gh<_i772.SignUpRemoteDataSource>()),
    );
    gh.factory<_i64.ChangPasswordRepo>(
      () => _i952.ChangPasswordRepoImpl(
        gh<_i100.ChangePasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i900.HomeRepo>(
      () => _i157.HomeRepoImpl(gh<_i1054.HomeRemoteDataSource>()),
    );
    gh.factory<_i249.ProductRepo>(
      () => _i683.ProductRepoImpl(gh<_i1029.ProductDataSource>()),
    );
    gh.factory<_i570.GetAllNotificationRepo>(
      () => _i805.GetAllNotificationRepoImpl(
        gh<_i680.GetAllNotificationRemoteDataSource>(),
      ),
    );
    gh.factory<_i797.UpdateUserPhotoUseCase>(
      () => _i797.UpdateUserPhotoUseCase(gh<_i583.ProfileRepo>()),
    );
    gh.factory<_i621.UpdateUserProfileUseCase>(
      () => _i621.UpdateUserProfileUseCase(gh<_i583.ProfileRepo>()),
    );
    gh.factory<_i53.ProductRepo>(
      () => _i146.ProductRepoImpl(gh<_i27.ProductRemoteDataSource>()),
    );
    gh.factory<_i608.ProductUseCase>(
      () => _i608.ProductUseCase(gh<_i53.ProductRepo>()),
    );
    gh.factory<_i326.AuthRepo>(
      () => _i253.AuthRepoImpl(gh<_i956.AuthRemoteDataSource>()),
    );
    gh.factory<_i974.LoginRepository>(
      () => _i674.LoginRepositoryImpl(gh<_i196.LoginDataSource>()),
    );
    gh.factory<_i144.CategoryRepo>(
      () => _i425.CategoryRepoImpl(gh<_i956.CategoryRemoteDataSource>()),
    );
    gh.factory<_i122.SavedAddressCubit>(
      () => _i122.SavedAddressCubit(gh<_i294.GetAddressUseCase>()),
    );
    gh.factory<_i124.BestSellerUseCase>(
      () => _i124.BestSellerUseCase(bestSellerRepo: gh<_i408.BestSellerRepo>()),
    );
    gh.factory<_i982.GetAllNotificationUseCase>(
      () => _i982.GetAllNotificationUseCase(gh<_i570.GetAllNotificationRepo>()),
    );
    gh.factory<_i14.ProductUseCase>(
      () => _i14.ProductUseCase(gh<_i249.ProductRepo>()),
    );
    gh.factory<_i105.GetLoggedUserDataRepo>(
      () =>
          _i340.GetLoggedUserDataRepoImpl(gh<_i455.GetLoggetUserDataSource>()),
    );
    gh.factory<_i123.SignUpUseCase>(
      () => _i123.SignUpUseCase(gh<_i948.SignUpRepo>()),
    );
    gh.factory<_i990.BestSellerUseCase>(
      () => _i990.BestSellerUseCase(homeRepo: gh<_i900.HomeRepo>()),
    );
    gh.factory<_i858.CategoryUseCase>(
      () => _i858.CategoryUseCase(homeRepo: gh<_i900.HomeRepo>()),
    );
    gh.factory<_i7.OccasionUseCase>(
      () => _i7.OccasionUseCase(homeRepo: gh<_i900.HomeRepo>()),
    );
    gh.factory<_i389.GetOrdersUseCase>(
      () => _i389.GetOrdersUseCase(gh<_i395.OrdersRepository>()),
    );
    gh.factory<_i125.BestSellerViewModel>(
      () => _i125.BestSellerViewModel(gh<_i124.BestSellerUseCase>()),
    );
    gh.factory<_i1027.LoginUseCase>(
      () => _i1027.LoginUseCase(loginRepository: gh<_i974.LoginRepository>()),
    );
    gh.factory<_i503.ChangePasswordUseCase>(
      () => _i503.ChangePasswordUseCase(gh<_i64.ChangPasswordRepo>()),
    );
    gh.factory<_i665.OrdersCubit>(
      () => _i665.OrdersCubit(gh<_i389.GetOrdersUseCase>()),
    );
    gh.factory<_i1000.OccasionCubit>(
      () => _i1000.OccasionCubit(
        gh<_i268.OccasionUseCase>(),
        gh<_i14.ProductUseCase>(),
      ),
    );
    gh.factory<_i18.ForgetPasswordUseCase>(
      () => _i18.ForgetPasswordUseCase(gh<_i326.AuthRepo>()),
    );
    gh.factory<_i194.ResetPasswordUseCase>(
      () => _i194.ResetPasswordUseCase(gh<_i326.AuthRepo>()),
    );
    gh.factory<_i649.VerifyResetCodeUseCase>(
      () => _i649.VerifyResetCodeUseCase(gh<_i326.AuthRepo>()),
    );
    gh.factory<_i878.CategoryUseCase>(
      () => _i878.CategoryUseCase(gh<_i144.CategoryRepo>()),
    );
    gh.factory<_i785.SignUpCubit>(
      () => _i785.SignUpCubit(gh<_i123.SignUpUseCase>()),
    );
    gh.factory<_i661.HomeTabViewModel>(
      () => _i661.HomeTabViewModel(
        categoryUseCase: gh<_i858.CategoryUseCase>(),
        bestSellerUseCase: gh<_i990.BestSellerUseCase>(),
        occasionUseCase: gh<_i7.OccasionUseCase>(),
      ),
    );
    gh.factory<_i718.NotificationsListCubit>(
      () => _i718.NotificationsListCubit(gh<_i982.GetAllNotificationUseCase>()),
    );
    gh.factory<_i143.ResetPasswordCubit>(
      () => _i143.ResetPasswordCubit(gh<_i503.ChangePasswordUseCase>()),
    );
    gh.factory<_i323.GetLoggedUserDataUseCase>(
      () => _i323.GetLoggedUserDataUseCase(gh<_i105.GetLoggedUserDataRepo>()),
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
    gh.factory<_i608.CategoryCubit>(
      () => _i608.CategoryCubit(
        gh<_i878.CategoryUseCase>(),
        gh<_i608.ProductUseCase>(),
      ),
    );
    gh.factory<_i256.ProfileCubit>(
      () => _i256.ProfileCubit(
        gh<_i323.GetLoggedUserDataUseCase>(),
        gh<_i503.ChangePasswordUseCase>(),
        gh<_i621.UpdateUserProfileUseCase>(),
        gh<_i797.UpdateUserPhotoUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i983.DioModule {}
