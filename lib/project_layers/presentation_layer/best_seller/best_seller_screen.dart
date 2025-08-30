import 'package:flower_app/project_layers/domain_layer/usecase/best_seller_use_case.dart';
import 'package:flower_app/project_layers/presentation_layer/best_seller/widgets/app_bar_best_seller.dart';
import 'package:flower_app/project_layers/presentation_layer/best_seller/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/di.dart';
import 'cubit/best_seller_cubit.dart';
import 'cubit/best_seller_state.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBestSeller(),
      body: BlocProvider(
        create: (_) => BestSellerViewModel(getIt<BestSellerUseCase>()),
        child: BlocBuilder<BestSellerViewModel, BestSellerState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<BestSellerViewModel>(context);
            if (state is BestSellerInitialState) {
              cubit.initializeHomeData();
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                ),
              );
            }

            if (state is BestSellerErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Error loading data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.bestSellerError?.toString() ?? 'Please try again',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: cubit.refreshData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[800],
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (cubit.isBestSellersLoading && cubit.bestSellers.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                ),
              );
            }

            if (cubit.bestSellers.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No products available',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                cubit.refreshData();
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.6,
                ),
                itemCount: cubit.bestSellers.length,
                itemBuilder: (context, index) {
                  final product = cubit.bestSellers[index];
                  return ProductCard(product: product);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
