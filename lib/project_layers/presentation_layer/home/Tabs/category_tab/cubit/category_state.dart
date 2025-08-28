part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<CategoryEntity>? categories;

  CategoryLoaded({this.categories});
}

final class CategoryError extends CategoryState {
  final String? message;

  CategoryError({this.message});
}

class ProductLoading extends CategoryState {}

final class ProductLoaded extends CategoryState {
  final List<ProductEntity>? products;

  ProductLoaded({this.products});
}

final class ProductError extends CategoryState {
  final String? message;

  ProductError({this.message});
}
