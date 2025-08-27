import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/domain_layer/usecase/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryUseCase categoryUseCase;
  CategoryCubit(this.categoryUseCase)
    : super(CategoryInitial());

  void getCategories() async {
    emit(CategoryLoading());

    ApiResult<List<CategoryEntity>> result =
        await categoryUseCase.call();

    switch (result) {
      case ApiSuccessResult<List<CategoryEntity>>():
        emit(CategoryLoaded(categories: result.data));

      // if (result.data.isNotEmpty) {
      //   getProducts(
      //     ProductFilter(
      //       categoryId: result.data.first.id,
      //     ),
      //   );
      // }
      case ApiErrorResult<List<CategoryEntity>>():
        emit(CategoryError(message: result.error));
    }
  }
}
