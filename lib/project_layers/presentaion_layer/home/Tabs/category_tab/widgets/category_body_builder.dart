import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/cubit/category_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/widgets/product_grid_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBodyBuilder extends StatelessWidget {
  const CategoryBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is CategoryLoaded ||
          current is CategoryError ||
          current is CategoryLoading,
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.pink,
            ),
          );
        } else if (state is CategoryError) {
          return Center(child: Text(state.message ?? ''));
        } else if (state is CategoryLoaded) {
          if (state.categories!.firstWhere(
                (element) => element.name == 'All',
                orElse: () =>
                    CategoryEntity(id: '0', name: 'All'),
              ) !=
              state.categories!.first) {
            state.categories!.insert(
              0,
              CategoryEntity(id: '0', name: 'All'),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTabController(
                length: state.categories?.length ?? 0,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.pink,
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.pink,
                  unselectedLabelColor: AppColors.grey,
                  tabAlignment: TabAlignment.center,
                  onTap: (index) {
                    // استخدام الدالة الجديدة
                    context
                        .read<CategoryCubit>()
                        .updateSelectedTab(index);
                  },
                  tabs: state.categories!.map((category) {
                    return Tab(text: category.name);
                  }).toList(),
                ),
              ),
              SizedBox(height: 2.heightPercent(context)),
              ProductsBuilder(),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
