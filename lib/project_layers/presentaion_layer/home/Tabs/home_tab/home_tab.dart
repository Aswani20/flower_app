import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/home/best_seller_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/home/category_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/home/occaison_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'components/address_selector.dart';
import 'components/home_card.dart';
import 'components/home_category.dart';
import 'components/home_header_section.dart';
import 'components/home_search_section.dart';
import 'cubit/home_tab_state.dart';
import 'cubit/home_tab_view_model.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeTabViewModel(
        categoryUseCase: getIt<CategoryUseCase>(),
        bestSellerUseCase: getIt<BestSellerUseCase>(),
        occasionUseCase: getIt<OccasionUseCase>(),
      )..initializeHomeData(),
      child: const _HomeTabBody(),
    );
  }
}

class _HomeTabBody extends StatelessWidget {
  const _HomeTabBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
      builder: (context, state) {
        final viewModel = context
            .read<HomeTabViewModel>();
        return Column(
          children: [
            // Search Section
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.searchView,
                );
              },
              child: IgnorePointer(
                child: HomeSearchSection(
                  onChanged: (value) {
                    //TODO: Handle search input changes
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // Address section
            AddressSelector(
              address:
                  'Deliver to 2XVP+XC - Sheikh Zayed',
              onTap: () {
                //TODO: Handle address selection
              },
            ),
            // Main Content
            Expanded(
              child: _buildContent(
                context,
                state,
                viewModel,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    HomeTabState state,
    HomeTabViewModel viewModel,
  ) {
    // Handle error states
    if (state is HomeTabErrorState) {
      return _buildErrorContent(
        context,
        state,
        viewModel,
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        viewModel.refreshData();
      },
      child: ListView(
        children: [
          // Categories Section
          _buildCategoriesSection(
            context,
            state,
            viewModel,
          ),

          // Best Sellers Section
          _buildBestSellersSection(
            context,
            state,
            viewModel,
          ),

          // Occasions Section
          _buildOccasionsSection(
            context,
            state,
            viewModel,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContent(
    BuildContext context,
    HomeTabErrorState state,
    HomeTabViewModel viewModel,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.w,
            color: Colors.red,
          ),
          SizedBox(height: 16.h),
          Text(
            'Something went wrong',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () => viewModel.refreshData(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection(
    BuildContext context,
    HomeTabState state,
    HomeTabViewModel viewModel,
  ) {
    return Column(
      children: [
        HomeHeaderSection(
          sectionTitle: AppLocalizations.of(
            context,
          )!.categories,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.categoryTab,
            );
          },
        ),
        Skeletonizer(
          enabled: viewModel.isCategoriesLoading,
          child: SizedBox(
            height: 100.h,
            width: double.infinity,
            child: ListView.separated(
              itemCount: viewModel.isCategoriesLoading
                  ? 5
                  : viewModel.categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                if (viewModel.isCategoriesLoading) {
                  // Show skeleton loading
                  return Container(
                    width: 80.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                  );
                }
                return HomeCategory(
                  category: viewModel.categories[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.CategoryTab,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBestSellersSection(
    BuildContext context,
    HomeTabState state,
    HomeTabViewModel viewModel,
  ) {
    return Column(
      children: [
        HomeHeaderSection(
          sectionTitle: AppLocalizations.of(
            context,
          )!.best_seller,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.bestSeller,
            );
          },
        ),
        Skeletonizer(
          enabled: viewModel.isBestSellersLoading,
          child: SizedBox(
            height: 190.h,
            width: double.infinity,
            child: ListView.separated(
              itemCount: viewModel.isBestSellersLoading
                  ? 5
                  : viewModel.bestSellers.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                if (viewModel.isBestSellersLoading) {
                  // Show skeleton loading
                  return Container(
                    width: 160.w,
                    height: 190.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                  );
                }
                return HomeCard(
                  onTap: () {
                    // Navigator to product details screen and give the product[index]
                    Navigator.pushNamed(
                      context,
                      AppRoutes.bestSeller,
                    );
                  },
                  bestSeller:
                      viewModel.bestSellers[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOccasionsSection(
    BuildContext context,
    HomeTabState state,
    HomeTabViewModel viewModel,
  ) {
    return Column(
      children: [
        HomeHeaderSection(
          sectionTitle: AppLocalizations.of(
            context,
          )!.occasion,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.occasionScreen,
            );
          },
        ),
        Skeletonizer(
          enabled: viewModel.isOccasionsLoading,
          child: SizedBox(
            height: 170.h,
            width: double.infinity,
            child: ListView.separated(
              itemCount: viewModel.isOccasionsLoading
                  ? 5
                  : viewModel.occasions.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                if (viewModel.isOccasionsLoading) {
                  // Show skeleton loading
                  return Container(
                    width: 160.w,
                    height: 170.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                  );
                }
                return HomeCard(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.OccasionScreen,
                    );
                  },
                  occasion: viewModel.occasions[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
