import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/orders_mapper.dart';
import 'package:flower_app/project_layers/domain_layer/repos/orders_repo.dart';
import 'package:injectable/injectable.dart';
import '../../api_layer/models/response/order_response.dart';
import '../../domain_layer/entities/orders_entity.dart';
import '../data_source/orders_data_source.dart';

@Injectable(as: OrdersRepository)
class OrdersRepoImpl implements OrdersRepository {
  final OrdersDataSource ordersDataSource;

  OrdersRepoImpl({required this.ordersDataSource});

  @override
  Future<ApiResult<List<OrdersEntity>>> orders() async {
    final result = await ordersDataSource.orders();

    if (result is ApiSuccessResult<OrderResponse>) {
      final data = result.data;
      final entities =
          data.orders
              ?.map((e) => e.toEntity())
              .toList() ??
          [];
      return ApiSuccessResult(entities);
    } else if (result is ApiErrorResult<OrderResponse>) {
      return ApiErrorResult(result.errorMessage);
    } else {
      return ApiErrorResult("Unknown error");
    }
  }
}
