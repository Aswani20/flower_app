import 'package:flower_app/core/di/modules/shared_preferences_module.dart';
import 'package:flower_app/core/keys/shared_key.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/failures.dart';
import '../../data_layer/data_source/login_data_source.dart';
import '../models/request/login_request.dart';
import '../models/response/login_response.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {
  final ApiClient apiClient;

  LoginDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponse> login({
    required LoginRequest request,
  }) async {
    try {
      final response = await apiClient.login(
        request: LoginRequest(
          email: request.email,
          password: request.password,
        ),
      );
      if (response.token != null) {
        await SharedPrefHelper().setString(
          key: SharedPrefKeys.tokenKey,
          stringValue: response.token!,
        );
      }
      if (response.token == null ||
          response.token!.isEmpty) {
        throw ServerError(
          errorMessage: "Invalid credentials",
        );
      }
      return response;
    } on NetworkError catch (e) {
      throw NetworkError(errorMessage: e.errorMessage);
    } on ServerError catch (e) {
      throw ServerError(errorMessage: e.errorMessage);
    } catch (e) {
      throw UserError(
        errorMessage: 'Unexpected error: $e',
      );
    }
  }
}
