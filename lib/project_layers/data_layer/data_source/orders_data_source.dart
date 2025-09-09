import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/response/order_response.dart';

abstract class OrdersDataSource {
  Future<ApiResult<OrderResponse>> orders();
}
