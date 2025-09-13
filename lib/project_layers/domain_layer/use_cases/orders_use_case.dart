import 'package:injectable/injectable.dart';

import '../../../core/api_result/api_result.dart';
import '../entities/orders_entity.dart';
import '../repos/orders_repo.dart';

@injectable
class GetOrdersUseCase {
  final OrdersRepository ordersRepository;

  GetOrdersUseCase(this.ordersRepository);

  Future<ApiResult<List<OrdersEntity>>> invoke() async {
    return await ordersRepository.orders();
  }
}
