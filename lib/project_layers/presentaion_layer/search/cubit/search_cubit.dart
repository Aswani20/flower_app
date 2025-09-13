import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_filter.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final ProductUseCase productUseCase;
  SearchCubit(this.productUseCase)
    : super(SearchInitial());

  String? currentKeyword;
  List<ProductEntity> searchResults = [];

  // البحث بالكلمة المفتاحية
  Future<void> searchProducts(String keyword) async {
    if (keyword.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    currentKeyword = keyword.trim();
    emit(SearchLoading());

    try {
      final filter = ProductFilter(
        keyword: currentKeyword,
      );

      final ApiResult<List<ProductEntity>> result =
          await productUseCase.call(filter);

      switch (result) {
        case ApiSuccessResult<List<ProductEntity>>():
          searchResults = result.data;
          if (searchResults.isEmpty) {
            emit(SearchEmpty(keyword: currentKeyword!));
          } else {
            emit(
              SearchSuccess(
                products: searchResults,
                keyword: currentKeyword!,
              ),
            );
          }

        case ApiErrorResult<List<ProductEntity>>():
          emit(
            SearchError(
              message: result.errorMessage,
              keyword: currentKeyword!,
            ),
          );
      }
    } catch (e) {
      emit(
        SearchError(
          message: e.toString(),
          keyword: currentKeyword!,
        ),
      );
    }
  }

  // البحث مع فلتر إضافي (فئة معينة)
  Future<void> searchInCategory({
    required String keyword,
    String? categoryId,
    String? occasionId,
  }) async {
    if (keyword.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    currentKeyword = keyword.trim();
    emit(SearchLoading());

    try {
      final filter = ProductFilter(
        keyword: currentKeyword,
        categoryId: categoryId,
        occasionId: occasionId,
      );

      final ApiResult<List<ProductEntity>> result =
          await productUseCase.call(filter);

      switch (result) {
        case ApiSuccessResult<List<ProductEntity>>():
          searchResults = result.data;
          if (searchResults.isEmpty) {
            emit(SearchEmpty(keyword: currentKeyword!));
          } else {
            emit(
              SearchSuccess(
                products: searchResults,
                keyword: currentKeyword!,
              ),
            );
          }

        case ApiErrorResult<List<ProductEntity>>():
          emit(
            SearchError(
              message: result.errorMessage,
              keyword: currentKeyword!,
            ),
          );
      }
    } catch (e) {
      emit(
        SearchError(
          message: e.toString(),
          keyword: currentKeyword!,
        ),
      );
    }
  }

  // مسح البحث
  void clearSearch() {
    currentKeyword = null;
    searchResults.clear();
    emit(SearchInitial());
  }

  // إعادة البحث (للـ refresh)
  void refreshSearch() {
    if (currentKeyword != null) {
      searchProducts(currentKeyword!);
    }
  }
}
