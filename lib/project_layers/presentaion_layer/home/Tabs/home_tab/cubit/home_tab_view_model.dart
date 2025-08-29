import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/home/best_seller_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/home/category_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/home/occaison_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'home_tab_state.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  final CategoryUseCase categoryUseCase;
  final BestSellerUseCase bestSellerUseCase;
  final OccasionUseCase occasionUseCase;

  HomeTabViewModel({
    required this.categoryUseCase,
    required this.bestSellerUseCase,
    required this.occasionUseCase,
  }) : super(const HomeTabInitialState());

  // Getters for accessing data from current state
  List<CategoryEntity> get categories {
    if (state is HomeTabLoadingState) {
      return (state as HomeTabLoadingState).categories;
    } else if (state is HomeTabLoadedState) {
      return (state as HomeTabLoadedState).categories;
    } else if (state is HomeTabErrorState) {
      return (state as HomeTabErrorState).categories;
    }
    return [];
  }

  List<BestSellerEntity> get bestSellers {
    if (state is HomeTabLoadingState) {
      return (state as HomeTabLoadingState).bestSellers;
    } else if (state is HomeTabLoadedState) {
      return (state as HomeTabLoadedState).bestSellers;
    } else if (state is HomeTabErrorState) {
      return (state as HomeTabErrorState).bestSellers;
    }
    return [];
  }

  List<OccasionEntity> get occasions {
    if (state is HomeTabLoadingState) {
      return (state as HomeTabLoadingState).occasions;
    } else if (state is HomeTabLoadedState) {
      return (state as HomeTabLoadedState).occasions;
    } else if (state is HomeTabErrorState) {
      return (state as HomeTabErrorState).occasions;
    }
    return [];
  }

  // Check if individual sections are loading
  bool get isCategoriesLoading {
    if (state is HomeTabLoadingState) {
      return (state as HomeTabLoadingState).isCategoriesLoading;
    } else if (state is HomeTabLoadedState) {
      return (state as HomeTabLoadedState).isCategoriesLoading;
    }
    return false;
  }

  bool get isBestSellersLoading {
    if (state is HomeTabLoadingState) {
      return (state as HomeTabLoadingState).isBestSellersLoading;
    } else if (state is HomeTabLoadedState) {
      return (state as HomeTabLoadedState).isBestSellersLoading;
    }
    return false;
  }

  bool get isOccasionsLoading {
    if (state is HomeTabLoadingState) {
      return (state as HomeTabLoadingState).isOccasionsLoading;
    } else if (state is HomeTabLoadedState) {
      return (state as HomeTabLoadedState).isOccasionsLoading;
    }
    return false;
  }

  // Initialize all data - call this once when the widget is created
  void initializeHomeData() {
    if (state is HomeTabInitialState) {
      categoriesRequest();
      bestSellerRequest();
      occasionRequest();
    }
  }

  // Load categories
  void categoriesRequest() async {
    try {
      // Set categories loading to true
      _updateLoadingState(isCategoriesLoading: true);

      final either = await categoryUseCase.invoke();

      either.fold(
        (categoryResponse) {
          // Success - extract categories list from response and set loading to false
          final categoryList = categoryResponse.categories ?? [];
          final currentState = state;
          if (currentState is HomeTabLoadingState) {
            emit(
              currentState.copyWith(
                categories: categoryList,
                isCategoriesLoading: false,
              ),
            );
          } else if (currentState is HomeTabLoadedState) {
            emit(
              currentState.copyWith(
                categories: categoryList,
                isCategoriesLoading: false,
              ),
            );
          } else {
            emit(
              HomeTabLoadedState(
                categories: categoryList,
                bestSellers: bestSellers,
                occasions: occasions,
                isCategoriesLoading: false,
                isBestSellersLoading: isBestSellersLoading,
                isOccasionsLoading: isOccasionsLoading,
              ),
            );
          }
        },
        (error) {
          // Error - emit error state
          emit(
            HomeTabErrorState(
              categoryError: error,
              categories: categories,
              bestSellers: bestSellers,
              occasions: occasions,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        HomeTabErrorState(
          categories: categories,
          bestSellers: bestSellers,
          occasions: occasions,
        ),
      );
    }
  }

  // Load best sellers
  void bestSellerRequest() async {
    try {
      // Set best sellers loading to true
      _updateLoadingState(isBestSellersLoading: true);

      final either = await bestSellerUseCase.invoke();

      either.fold(
        (bestSellerResponse) {
          // Success - extract best sellers list from response and set loading to false
          final bestSellerList = bestSellerResponse.bestSeller ?? [];
          final currentState = state;
          if (currentState is HomeTabLoadingState) {
            emit(
              currentState.copyWith(
                bestSellers: bestSellerList,
                isBestSellersLoading: false,
              ),
            );
          } else if (currentState is HomeTabLoadedState) {
            emit(
              currentState.copyWith(
                bestSellers: bestSellerList,
                isBestSellersLoading: false,
              ),
            );
          } else {
            emit(
              HomeTabLoadedState(
                categories: categories,
                bestSellers: bestSellerList,
                occasions: occasions,
                isCategoriesLoading: isCategoriesLoading,
                isBestSellersLoading: false,
                isOccasionsLoading: isOccasionsLoading,
              ),
            );
          }
        },
        (error) {
          // Error - emit error state
          emit(
            HomeTabErrorState(
              bestSellerError: error,
              categories: categories,
              bestSellers: bestSellers,
              occasions: occasions,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        HomeTabErrorState(
          categories: categories,
          bestSellers: bestSellers,
          occasions: occasions,
        ),
      );
    }
  }

  // Load occasions
  void occasionRequest() async {
    try {
      // Set occasions loading to true
      _updateLoadingState(isOccasionsLoading: true);

      final either = await occasionUseCase.invoke();

      either.fold(
        (occasionResponse) {
          // Success - extract occasions list from response and set loading to false
          final occasionList = occasionResponse.occasions ?? [];
          final currentState = state;
          if (currentState is HomeTabLoadingState) {
            emit(
              currentState.copyWith(
                occasions: occasionList,
                isOccasionsLoading: false,
              ),
            );
          } else if (currentState is HomeTabLoadedState) {
            emit(
              currentState.copyWith(
                occasions: occasionList,
                isOccasionsLoading: false,
              ),
            );
          } else {
            emit(
              HomeTabLoadedState(
                categories: categories,
                bestSellers: bestSellers,
                occasions: occasionList,
                isCategoriesLoading: isCategoriesLoading,
                isBestSellersLoading: isBestSellersLoading,
                isOccasionsLoading: false,
              ),
            );
          }
        },
        (error) {
          // Error - emit error state
          emit(
            HomeTabErrorState(
              occasionError: error,
              categories: categories,
              bestSellers: bestSellers,
              occasions: occasions,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        HomeTabErrorState(
          categories: categories,
          bestSellers: bestSellers,
          occasions: occasions,
        ),
      );
    }
  }

  // Helper method to update loading state
  void _updateLoadingState({
    bool? isCategoriesLoading,
    bool? isBestSellersLoading,
    bool? isOccasionsLoading,
  }) {
    final currentState = state;

    if (currentState is HomeTabLoadingState) {
      emit(
        currentState.copyWith(
          isCategoriesLoading: isCategoriesLoading,
          isBestSellersLoading: isBestSellersLoading,
          isOccasionsLoading: isOccasionsLoading,
        ),
      );
    } else if (currentState is HomeTabLoadedState) {
      emit(
        currentState.copyWith(
          isCategoriesLoading: isCategoriesLoading,
          isBestSellersLoading: isBestSellersLoading,
          isOccasionsLoading: isOccasionsLoading,
        ),
      );
    } else {
      emit(
        HomeTabLoadingState(
          categories: categories,
          bestSellers: bestSellers,
          occasions: occasions,
          isCategoriesLoading: isCategoriesLoading ?? false,
          isBestSellersLoading: isBestSellersLoading ?? false,
          isOccasionsLoading: isOccasionsLoading ?? false,
        ),
      );
    }
  }

  // Refresh all data
  void refreshData() {
    categoriesRequest();
    bestSellerRequest();
    occasionRequest();
  }
}
