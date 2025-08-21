import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../requests/login_request/login_request.dart';
import '../responses/login_response/login_response.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://flower.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('v1/auth/signin')
  Future<LoginResponse> login({@Body() required LoginRequest request});


}
