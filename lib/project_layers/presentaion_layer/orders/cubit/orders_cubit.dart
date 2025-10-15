import 'package:bloc/bloc.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/orders_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/orders/cubit/state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_result/api_result.dart';
import '../../../domain_layer/entities/orders_entity.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getUserOrdersUsecase;

  OrdersCubit(this.getUserOrdersUsecase)
    : super(const OrdersState());

  Future<void> getUserOrders() async {
    emit(state.copyWith(isLoading: true));

    final result = await getUserOrdersUsecase.invoke();

    switch (result) {
      case ApiSuccessResult<List<OrdersEntity>>():
        final pending = result.data
            .where((o) => o.state != "completed")
            .toList();
        final completed = result.data
            .where((o) => o.state == "completed")
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            allOrders: result.data,
            pendingOrders: pending,
            completedOrders: completed,
          ),
        );
        break;
      case ApiErrorResult<List<OrdersEntity>>():
        emit(
          state.copyWith(
            isLoading: false,
            isFailure: true,
            errorMessage: result
                .errorMessage, // أو result.failure.errorMessage حسب الـ ApiResult
          ),
        );
        break;
    }
  }
}
