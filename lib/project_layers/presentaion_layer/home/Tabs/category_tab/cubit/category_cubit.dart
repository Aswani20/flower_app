import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_filter.dart';
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

  final List<String> filters = [
    'Lowest Price',
    'Highest Price',
    'New',
    'Old',
    'Discount',
  ];
  // i want to get the prudacts with the filter how
  void getCategories() async {
    emit(CategoryLoading());

    ApiResult<List<CategoryEntity>> result =
        await categoryUseCase.call();

    switch (result) {
      case ApiSuccessResult<List<CategoryEntity>>():
        emit(CategoryLoaded(categories: result.data));

        if (result.data.isNotEmpty) {
          getProducts(
            ProductFilter(categoryId: result.data[0].id),
          );
        }
      case ApiErrorResult<List<CategoryEntity>>():
        emit(CategoryError(message: result.errorMessage));
    }
  }

  Future<void> getProducts(ProductFilter filter) async {
    // i want to get the prudacts with the filter how
    emit(ProductLoading());
    ApiResult<List<ProductEntity>> result =
        await productUseCase.call(filter);
    switch (result) {
      case ApiSuccessResult<List<ProductEntity>>():
        emit(ProductLoaded(products: result.data));

      case ApiErrorResult<List<ProductEntity>>():
        emit(ProductError(message: result.errorMessage));
    }
  }
}
