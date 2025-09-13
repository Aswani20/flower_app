part of 'search_cubit.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductEntity> products;
  final String keyword;

  SearchSuccess({
    required this.products,
    required this.keyword,
  });
}

class SearchEmpty extends SearchState {
  final String keyword;

  SearchEmpty({required this.keyword});
}

class SearchError extends SearchState {
  final String message;
  final String keyword;

  SearchError({
    required this.message,
    required this.keyword,
  });
}
