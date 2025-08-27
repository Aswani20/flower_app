import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/cubit/category_cubit.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/widgets/custtom_search.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/widgets/filter_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final categoryList = [
    //   Category(name: 'All'),
    //   Category(name: 'New'),
    //   Category(name: 'Popular'),
    //   Category(name: 'Trending'),
    //   Category(name: 'Featured'),
    // ];
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
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SearchScreen(),
                  //   ),
                  // ),
                  child: IgnorePointer(
                    // child: CustomSearch(),
                    child: CustomSearch(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    // final selectedFilter =
                    //     await FloatingButton.showModalBottomSheetList(
                    //       context,
                    //     );
                    // if (selectedFilter != null) {
                    //   context
                    //       .read<CategoriesCubit>()
                    //       .getProducts(selectedFilter);
                    // }
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
                      // child: SvgPicture.asset(
                      //   IconsAssets.filter,
                      //   width: 18,
                      //   height: 12,
                      //   fit: BoxFit.contain,
                      // ),
                      child: Icon(Icons.filter),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.pink,
                ),
              );
            } else if (state is CategoryError) {
              return Center(
                child: Text(state.message ?? ''),
              );
            } else if (state is CategoryLoaded) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    DefaultTabController(
                      length:
                          state.categories?.length ?? 0,
                      // state.categoryList?.length ?? 0,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: AppColors.pink,
                        dividerColor: Colors.transparent,
                        labelColor: AppColors.pink,
                        unselectedLabelColor:
                            AppColors.grey,
                        tabAlignment: TabAlignment.center,
                        onTap: (index) {
                          // final selectedCategory =
                          //     state.categoryList?[index].id;
                          // context
                          //     .read<CategoriesCubit>()
                          //     .getProducts(
                          //       ProductFilter(
                          //         categoryId:
                          //             selectedCategory,
                          //       ),
                          //     );
                        },
                        tabs: state.categories!.map((
                          category,
                        ) {
                          return Tab(text: category.name);
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 2.heightPercent(context),
                    ),
                    ...[
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding:
                                  const EdgeInsets.all(0),
                              sliver: SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Navigator.pushNamed(
                                        //   context,
                                        //   Routes
                                        //       .productDetails,
                                        //   arguments: state
                                        //       .products![index],
                                        // );
                                      },
                                      child: Card(
                                        color: AppColors
                                            .white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(
                                                12,
                                              ),
                                          side: BorderSide(
                                            color: AppColors
                                                .grey
                                                .withOpacity(
                                                  .7,
                                                ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(
                                                8.0,
                                              ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                            children: [
                                              Expanded(
                                                child: Image.network(
                                                  // state
                                                  //     .products![index]
                                                  //     .imgCover
                                                  //     .toString(),
                                                  'https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                                  width: double
                                                      .infinity,
                                                  height:
                                                      200,
                                                  fit: BoxFit
                                                      .fill,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1
                                                    .heightPercent(
                                                      context,
                                                    ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal:
                                                      8.0,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.topLeft,
                                                  child: Text(
                                                    // state
                                                    //     .products![index]
                                                    //     .title
                                                    //     .toString(),
                                                    'red roses',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.black,
                                                      fontSize:
                                                          12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal:
                                                      8.0,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      // "${lang!.currency} ${state.products![index].priceAfterDiscount}",
                                                      'EGP 600',
                                                      style: TextStyle(
                                                        color: AppColors.black,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 1.widthPercent(
                                                        context,
                                                      ),
                                                    ),
                                                    Text(
                                                      //  "${state.products![index].price}",
                                                      '800',
                                                      style: TextStyle(
                                                        color: AppColors.grey,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12,
                                                        decoration: TextDecoration.lineThrough,
                                                        decorationColor: AppColors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          5,
                                                    ),
                                                    Text(
                                                      //  "${state.products![index].discount}%",
                                                      '20 %',
                                                      style: TextStyle(
                                                        color: AppColors.green,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width:
                                                    147,
                                                height:
                                                    30,
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .pink,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        25,
                                                      ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.shopping_cart,
                                                      color:
                                                          AppColors.white,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          8,
                                                    ),
                                                    Text(
                                                      // context.l10n.addToCart,
                                                      'Add To Cart',
                                                      style: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: 10,

                                  // state
                                  //     .products
                                  //     ?.length,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 2
                                          .heightPercent(
                                            context,
                                          ),
                                      crossAxisSpacing: 2
                                          .widthPercent(
                                            context,
                                          ),
                                      childAspectRatio:
                                          0.75,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
        floatingActionButton: FilterBottom(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
