import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/api_layer/models/categories_response.dart';
import 'package:flower_app/project_layers/api_layer/models/get_all_notification_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/products_response.dart';
import 'package:flower_app/project_layers/api_layer/models/request/change_password_request_body.dart';
import 'package:flower_app/project_layers/api_layer/models/request/forget_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/request/login_request.dart';
import 'package:flower_app/project_layers/api_layer/models/request/reset_password_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/api_layer/models/request/update_profile_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/request/verify_reset_code_request_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/best_seller_response.dart';
import 'package:flower_app/project_layers/api_layer/models/response/best_seller_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/category_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/change_password_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/forget_password_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/get_logged_user_data_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/occasion_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/reset_password_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/sign_up_response.dart';
import 'package:flower_app/project_layers/api_layer/models/response/update_photo_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/update_profile_response_dto.dart';
import 'package:flower_app/project_layers/api_layer/models/response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/response/login_response.dart';
import '../models/response/order_response.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://flower.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/v1/categories")
  Future<HttpResponse<CategoryResponseDto>>
  getCategories();

  @GET("/v1/best-seller")
  Future<HttpResponse<BestSellerResponse>>
  getBestSellersProduct();

  @GET("/v1/best-seller")
  Future<HttpResponse<BestSellerResponseDto>>
  getBestSellers();

  @GET("/v1/occasions")
  Future<HttpResponse<OccasionResponseDto>>
  getOccasions();

  @POST('v1/auth/signup')
  Future<SignUpResponse> signUp(
    @Body() SignUpRequestBody signUpRequest,
  );

  @POST('v1/auth/signin')
  Future<LoginResponse> login({
    @Body() required LoginRequest request,
  });

  @POST('/v1/auth/forgotPassword')
  Future<HttpResponse<ForgetPasswordResponseDto>>
  forgetPassword({
    @Body()
    required ForgetPasswordRequestDto
    forgetPasswordRequestDto,
  });

  @POST('/v1/auth/verifyResetCode')
  Future<HttpResponse<VerifyResetCodeResponseDto>>
  verifyResetCode({
    @Body()
    required VerifyResetCodeRequestDto
    verifyResetCodeRequestDto,
  });

  @PUT('/v1/auth/resetPassword')
  Future<HttpResponse<ResetPasswordResponseDto>>
  resetPassword({
    @Body()
    required ResetPasswordRequestDto
    resetPasswordRequestDto,
  });

  @GET('/v1/categories')
  Future<CategoriesResponse> getAllCategories();

  @GET('/v1/products')
  Future<ProductsResponse> getProductsById(
    @Queries() Map<String, dynamic> filters,
  );

  @GET('v1/auth/profile-data')
  Future<GetLoggedUserDataResponseDto>
  getLoggedUserData();

  @PATCH('v1/auth/change-password')
  Future<ChangePasswordResponseDto> changePassword(
    @Body() ChangePasswordRequestBody request,
  );

  @PUT('v1/auth/editProfile')
  Future<UpdateProfileResponseDto> editProfile(
    @Body() UpdateProfileRequestDto request,
  );

  @PUT('v1/auth/upload-photo')
  @MultiPart()
  Future<UpdatePhotoResponseDto> changePhoto(
    @Part(name: "photo") File photo,
  );

  @GET('/v1/notifications')
  Future<GetAllNotificationResponseDto>
  getNotifications();

  @DELETE('/v1/orders')
  Future<OrderResponse> orders();
}
