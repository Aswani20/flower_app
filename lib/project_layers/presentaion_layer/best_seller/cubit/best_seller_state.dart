import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';

abstract class BestSellerState {
  const BestSellerState();
}

// Initial state
class BestSellerInitialState extends BestSellerState {
  const BestSellerInitialState();
}

// Loading states for individual sections
class BestSellerLoadingState extends BestSellerState {
  final bool isBestSellersLoading;
  final List<BestSellerEntity> bestSellers;

  const BestSellerLoadingState({
    this.isBestSellersLoading = false,
    this.bestSellers = const [],
  });

  BestSellerLoadingState copyWith({
    bool? isBestSellersLoading,
    List<BestSellerEntity>? bestSellers,
  }) {
    return BestSellerLoadingState(
      isBestSellersLoading: isBestSellersLoading ?? this.isBestSellersLoading,
      bestSellers: bestSellers ?? this.bestSellers,
    );
  }
}

// Success state with all data
class BestSellerLoadedState extends BestSellerState {
  final List<BestSellerEntity> bestSellers;
  final bool isBestSellersLoading;

  const BestSellerLoadedState({
    required this.bestSellers,
    this.isBestSellersLoading = false,
  });

  BestSellerLoadedState copyWith({
    List<BestSellerEntity>? bestSellers,
    bool? isBestSellersLoading,
  }) {
    return BestSellerLoadedState(
      bestSellers: bestSellers ?? this.bestSellers,
      isBestSellersLoading: isBestSellersLoading ?? this.isBestSellersLoading,
    );
  }
}

// Error state
class BestSellerErrorState extends BestSellerState {
  final Failures? bestSellerError;
  final List<BestSellerEntity> bestSellers;

  const BestSellerErrorState({this.bestSellerError, this.bestSellers = const []});
}