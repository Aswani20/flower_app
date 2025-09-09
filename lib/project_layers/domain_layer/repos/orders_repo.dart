import '../../../core/api_result/api_result.dart';
import '../entities/orders_entity.dart';

abstract class OrdersRepository {
  Future<ApiResult<List<OrdersEntity>>> orders();
}
