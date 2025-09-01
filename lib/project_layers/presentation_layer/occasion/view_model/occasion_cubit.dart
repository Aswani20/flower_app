import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain_layer/entities/occasion_response_entity.dart';
import '../../../domain_layer/usecase/occasion_usecase.dart';
import '../../../domain_layer/usecase/product_usecase.dart';
import 'occasion_state.dart';


@injectable
class OccasionCubit extends Cubit<OccasionState> {
  OccasionUseCase occasionUseCase;
  ProductUseCase productUseCase;
  OccasionCubit(this.occasionUseCase, this.productUseCase)
      : super(OccasionInitial());

  void getOccasions() async {
    emit(OccasionLoading());

    ApiResult<List<OccasionEntity>> result =
    await occasionUseCase.call();

    switch (result) {
      case ApiSuccessResult<List<OccasionEntity>>():
        emit(OccasionLoaded(occasions: result.data));

        if (result.data.isNotEmpty) {
          getProducts(result.data.first.id);
        }
      case ApiErrorResult<List<OccasionEntity>>():
        emit(OccasionError(message: result.error));
    }
  }

  Future<void> getProducts(String? categoryId) async {
    emit(ProductLoading());
    ApiResult<List<ProductEntity>> result =
    await productUseCase.call(categoryId);
    switch (result) {
      case ApiSuccessResult<List<ProductEntity>>():
        emit(ProductLoaded(products: result.data));

      case ApiErrorResult<List<ProductEntity>>():
        emit(ProductError(message: result.error));
    }
  }
}
