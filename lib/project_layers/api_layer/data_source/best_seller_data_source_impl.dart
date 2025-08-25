import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/responses/best_seller_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../../data_layer/data_source/best_seller_data_source.dart';

@Injectable(as: BestSellerDataSource)
class BestSellerDataSourceImpl implements BestSellerDataSource {
  final ApiClient apiClient;

  BestSellerDataSourceImpl({required this.apiClient});

  @override
  Future<BestSellerResponse> bestSeller() async {
    try {
      final response = await apiClient.getBestSeller();
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
