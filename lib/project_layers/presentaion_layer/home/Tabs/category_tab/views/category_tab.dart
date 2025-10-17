import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain_layer/entities/product_filter.dart';
import '../cubit/category_cubit.dart';
import '../widgets/category_body_builder.dart';
import '../widgets/custtom_search.dart';
import '../widgets/filter_bottom.dart';

// ignore: camel_case_types
class categoryTab extends StatelessWidget {
  const categoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CategoryCubit>()..getCategories(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.searchView,
                        );
                      },
                      child: IgnorePointer(
                        child: CustomSearch(
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final selectedFilter =
                            await FloatingButton.showModalBottomSheetList(
                              context,
                            );

                        if (selectedFilter != null) {
                          context
                              .read<CategoryCubit>()
                              .getProducts(
                                ProductFilter(
                                  filter: selectedFilter
                                      .filter,
                                ),
                              );
                        }
                      },

                      child: Container(
                        width: 64,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey,
                          ),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.icons.sortIcon.path,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            body: CategoryBodyBuilder(),
            floatingActionButton: FloatingButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
