import '../../../domain_layer/entities/occasion_response_entity.dart';
import '../../../domain_layer/entities/product_entity.dart';


sealed class OccasionState {}

final class OccasionInitial extends OccasionState {}

final class OccasionLoading extends OccasionState {}

final class OccasionLoaded extends OccasionState {
  final List<OccasionEntity>? occasions;

  OccasionLoaded({this.occasions});
}

final class OccasionError extends OccasionState {
  final String? message;

  OccasionError({this.message});
}

class ProductLoading extends OccasionState {}

final class ProductLoaded extends OccasionState {
  final List<ProductEntity>? products;

  ProductLoaded({this.products});
}

final class ProductError extends OccasionState {
  final String? message;

  ProductError({this.message});
}
