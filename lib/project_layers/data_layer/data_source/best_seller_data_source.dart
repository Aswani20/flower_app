import 'package:flower_app/project_layers/api_layer/responses/best_seller_response.dart';

abstract class BestSellerDataSource {
  Future<BestSellerResponse> bestSeller();
}
