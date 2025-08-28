import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/cubit/category_cubit.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/widgets/category_body_builder.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/widgets/custtom_search.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/widgets/filter_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CategoryCubit>()..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Expanded(
                flex: 4,
                child: InkWell(
                  // onTap: () => Navigator to search screen from here
                  child: CustomSearch(
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    // here we will open filter bottom sheet
                  },
                  child: Container(
                    width: 64,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.grey,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
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
        floatingActionButton: FilterBottom(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
