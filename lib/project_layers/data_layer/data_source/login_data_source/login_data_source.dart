import 'package:flower_app/project_layers/api_layer/requests/login_request/login_request.dart';

import '../../../api_layer/responses/login_response/login_response.dart';

abstract class LoginDataSource {
  Future<LoginResponse> login({required LoginRequest request});
}
