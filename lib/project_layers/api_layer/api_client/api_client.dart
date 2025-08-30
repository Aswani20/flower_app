import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://flower.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;


  @GET("/v1/categories")
  Future<HttpResponse<CategoryResponseDto>> getCategories();

  @GET("/v1/best-seller")
  Future<HttpResponse<BestSellerResponse>> getBestSellersProduct();

  @GET("/v1/best-seller")
  Future<HttpResponse<BestSellerResponseDto>> getBestSellers();


  @GET("/v1/occasions")
  Future<HttpResponse<OccasionResponseDto>> getOccasions();


  @POST(AppConstants.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequest);

  @POST('v1/auth/signin')
  Future<LoginResponse> login({@Body() required LoginRequest request});

  @POST('/v1/auth/forgotPassword')
  Future<HttpResponse<ForgetPasswordResponseDto>> forgetPassword({
    @Body() required ForgetPasswordRequestDto forgetPasswordRequestDto,
  });

  @POST('/v1/auth/verifyResetCode')
  Future<HttpResponse<VerifyResetCodeResponseDto>> verifyResetCode({
    @Body() required VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  });

  @PUT('/v1/auth/resetPassword')
  Future<HttpResponse<ResetPasswordResponseDto>> resetPassword({
    @Body() required ResetPasswordRequestDto resetPasswordRequestDto,
});


  @GET(AppConstants.categories)
  Future<CategoriesResponse> getAllCategories();

  @GET(AppConstants.products)
  Future<ProductsResponse> getProductsById(
    @Query("category") String? categoryId,
  );
}
