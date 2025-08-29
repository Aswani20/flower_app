import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';

abstract class HomeTabState {
  const HomeTabState();
}

// Initial state
class HomeTabInitialState extends HomeTabState {
  const HomeTabInitialState();
}

// Loading states for individual sections
class HomeTabLoadingState extends HomeTabState {
  final bool isCategoriesLoading;
  final bool isBestSellersLoading;
  final bool isOccasionsLoading;
  final List<CategoryEntity> categories;
  final List<BestSellerEntity> bestSellers;
  final List<OccasionEntity> occasions;

  const HomeTabLoadingState({
    this.isCategoriesLoading = false,
    this.isBestSellersLoading = false,
    this.isOccasionsLoading = false,
    this.categories = const [],
    this.bestSellers = const [],
    this.occasions = const [],
  });

  HomeTabLoadingState copyWith({
    bool? isCategoriesLoading,
    bool? isBestSellersLoading,
    bool? isOccasionsLoading,
    List<CategoryEntity>? categories,
    List<BestSellerEntity>? bestSellers,
    List<OccasionEntity>? occasions,
  }) {
    return HomeTabLoadingState(
      isCategoriesLoading: isCategoriesLoading ?? this.isCategoriesLoading,
      isBestSellersLoading: isBestSellersLoading ?? this.isBestSellersLoading,
      isOccasionsLoading: isOccasionsLoading ?? this.isOccasionsLoading,
      categories: categories ?? this.categories,
      bestSellers: bestSellers ?? this.bestSellers,
      occasions: occasions ?? this.occasions,
    );
  }
}

// Success state with all data
class HomeTabLoadedState extends HomeTabState {
  final List<CategoryEntity> categories;
  final List<BestSellerEntity> bestSellers;
  final List<OccasionEntity> occasions;
  final bool isCategoriesLoading;
  final bool isBestSellersLoading;
  final bool isOccasionsLoading;

  const HomeTabLoadedState({
    required this.categories,
    required this.bestSellers,
    required this.occasions,
    this.isCategoriesLoading = false,
    this.isBestSellersLoading = false,
    this.isOccasionsLoading = false,
  });

  HomeTabLoadedState copyWith({
    List<CategoryEntity>? categories,
    List<BestSellerEntity>? bestSellers,
    List<OccasionEntity>? occasions,
    bool? isCategoriesLoading,
    bool? isBestSellersLoading,
    bool? isOccasionsLoading,
  }) {
    return HomeTabLoadedState(
      categories: categories ?? this.categories,
      bestSellers: bestSellers ?? this.bestSellers,
      occasions: occasions ?? this.occasions,
      isCategoriesLoading: isCategoriesLoading ?? this.isCategoriesLoading,
      isBestSellersLoading: isBestSellersLoading ?? this.isBestSellersLoading,
      isOccasionsLoading: isOccasionsLoading ?? this.isOccasionsLoading,
    );
  }
}

// Error state
class HomeTabErrorState extends HomeTabState {
  final Failures? categoryError;
  final Failures? bestSellerError;
  final Failures? occasionError;
  final List<CategoryEntity> categories;
  final List<BestSellerEntity> bestSellers;
  final List<OccasionEntity> occasions;

  const HomeTabErrorState({
    this.categoryError,
    this.bestSellerError,
    this.occasionError,
    this.categories = const [],
    this.bestSellers = const [],
    this.occasions = const [],
  });
}
