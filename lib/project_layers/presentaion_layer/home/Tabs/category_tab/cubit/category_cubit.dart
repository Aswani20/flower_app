import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/category_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryUseCase categoryUseCase;
  ProductUseCase productUseCase;
  CategoryCubit(this.categoryUseCase, this.productUseCase)
    : super(CategoryInitial());

  void getCategories() async {
    emit(CategoryLoading());

    ApiResult<List<CategoryEntity>> result =
        await categoryUseCase.call();

    switch (result) {
      case ApiSuccessResult<List<CategoryEntity>>():
        emit(CategoryLoaded(categories: result.data));

        if (result.data.isNotEmpty) {
          getProducts(result.data.first.id);
        }
      case ApiErrorResult<List<CategoryEntity>>():
        emit(CategoryError(message: result.errorMessage));
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
        emit(ProductError(message: result.errorMessage));
    }
  }
}
