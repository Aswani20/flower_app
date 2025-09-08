import 'package:flower_app/project_layers/api_layer/models/request/login_request.dart';

import '../../api_layer/models/response/login_response.dart';

abstract class LoginDataSource {
  Future<LoginResponse> login({required LoginRequest request});
}
