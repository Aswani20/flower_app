import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/best_seller_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'best_seller_state.dart';

@injectable
class BestSellerViewModel extends Cubit<BestSellerState> {
  final BestSellerUseCase bestSellerUseCase;

  BestSellerViewModel(this.bestSellerUseCase)
    : super(const BestSellerInitialState());

  List<BestSellerEntity> get bestSellers {
    if (state is BestSellerLoadingState) {
      return (state as BestSellerLoadingState)
          .bestSellers;
    } else if (state is BestSellerLoadedState) {
      return (state as BestSellerLoadedState).bestSellers;
    } else if (state is BestSellerErrorState) {
      return (state as BestSellerErrorState).bestSellers;
    }
    return [];
  }

  bool get isBestSellersLoading {
    if (state is BestSellerLoadingState) {
      return (state as BestSellerLoadingState)
          .isBestSellersLoading;
    } else if (state is BestSellerLoadedState) {
      return (state as BestSellerLoadedState)
          .isBestSellersLoading;
    }
    return false;
  }

  // Initialize all data - call this once when the widget is created
  void initializeHomeData() {
    if (state is BestSellerInitialState) {
      bestSellerRequest();
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
          final bestSellerList =
              bestSellerResponse.bestSeller ?? [];
          final currentState = state;
          if (currentState is BestSellerLoadingState) {
            emit(
              currentState.copyWith(
                bestSellers: bestSellerList,
                isBestSellersLoading: false,
              ),
            );
          } else if (currentState
              is BestSellerLoadedState) {
            emit(
              currentState.copyWith(
                bestSellers: bestSellerList,
                isBestSellersLoading: false,
              ),
            );
          } else {
            emit(
              BestSellerLoadedState(
                bestSellers: bestSellerList,
                isBestSellersLoading: false,
              ),
            );
          }
        },
        (error) {
          // Error - emit error state
          emit(
            BestSellerErrorState(
              bestSellerError: error,
              bestSellers: bestSellers,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        BestSellerErrorState(bestSellers: bestSellers),
      );
    }
  }

  // Load occasions

  // Helper method to update loading state
  void _updateLoadingState({bool? isBestSellersLoading}) {
    final currentState = state;

    if (currentState is BestSellerLoadingState) {
      emit(
        currentState.copyWith(
          isBestSellersLoading: isBestSellersLoading,
        ),
      );
    } else if (currentState is BestSellerLoadedState) {
      emit(
        currentState.copyWith(
          isBestSellersLoading: isBestSellersLoading,
        ),
      );
    } else {
      emit(
        BestSellerLoadingState(
          bestSellers: bestSellers,
          isBestSellersLoading:
              isBestSellersLoading ?? false,
        ),
      );
    }
  }

  // Refresh all data
  void refreshData() {
    bestSellerRequest();
  }
}
