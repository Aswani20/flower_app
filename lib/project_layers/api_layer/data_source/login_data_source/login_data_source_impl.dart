import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../data_layer/data_source/login_data_source/login_data_source.dart';
import '../../requests/login_request/login_request.dart';
import '../../responses/login_response/login_response.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {
  final ApiClient apiClient;

  LoginDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponse> login({required LoginRequest request}) async {
    try {
      final response = await apiClient.login(
        request: LoginRequest(email: request.email, password: request.password),
      );
      if (response.token == null || response.token!.isEmpty) {
        throw ServerError(errorMessage: "Invalid credentials");
      }
      return response;
    } on NetworkError catch (e) {
      throw NetworkError(errorMessage: e.errorMessage);
    } on ServerError catch (e) {
      throw ServerError(errorMessage: e.errorMessage);
    } catch (e) {
      throw UserError(errorMessage: 'Unexpected error: $e');
    }
  }
}
