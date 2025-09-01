import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/product_gride_byilder.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/view_model/occasion_cubit.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/view_model/occasion_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionBodyBuilder extends StatelessWidget {
  const OccasionBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccasionCubit, OccasionState>(
      buildWhen: (previous, current) =>
          current is OccasionLoaded ||
          current is OccasionError ||
          current is OccasionLoading,
      builder: (context, state) {
        if (state is OccasionLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.pink,
            ),
          );
        } else if (state is OccasionError) {
          return Center(child: Text(state.message ?? ''));
        } else if (state is OccasionLoaded) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTabController(
                  length: state.occasions?.length ?? 0,
                  // state.categoryList?.length ?? 0,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: AppColors.pink,
                    dividerColor: Colors.transparent,
                    labelColor: AppColors.pink,
                    unselectedLabelColor: AppColors.grey,
                    tabAlignment: TabAlignment.center,
                    onTap: (index) {
                      final selectedCategory = state.occasions?[index].id;
                      context.read<OccasionCubit>().getProducts(
                        selectedCategory,
                      );
                    },
                    tabs: state.occasions!.map((category) {
                      return Tab(text: category.name);
                    }).toList(),
                  ),
                ),
                SizedBox(height: 2),
                ProductsGridBuilder(),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
