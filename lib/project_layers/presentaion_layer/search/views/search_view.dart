import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController =
      TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.search),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // شريط البحث
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    focusNode: searchFocusNode,

                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      hintText:
                          context.l10n.searchInProduct,

                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon:
                          searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear,
                              ),
                              onPressed: () {
                                searchController.clear();
                                context
                                    .read<SearchCubit>()
                                    .clearSearch();
                                setState(() {});
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding:
                          const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                    ),
                    onChanged: (value) {
                      setState(() {});

                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          if (value.trim() ==
                              searchController.text
                                  .trim()) {
                            context
                                .read<SearchCubit>()
                                .searchProducts(value);
                          }
                        },
                      );
                    },
                    onSubmitted: (value) {
                      context
                          .read<SearchCubit>()
                          .searchProducts(value);
                    },
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return _buildSearchContent(state);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchContent(SearchState state) {
    switch (state.runtimeType) {
      case SearchInitial:
        return _buildInitialState();

      case SearchLoading:
        return _buildLoadingState();

      case SearchSuccess:
        final successState = state as SearchSuccess;
        return _buildSuccessState(
          successState.products,
          successState.keyword,
        );

      case SearchEmpty:
        final emptyState = state as SearchEmpty;
        return _buildEmptyState(emptyState.keyword);

      case SearchError:
        final errorState = state as SearchError;
        return _buildErrorState(
          errorState.message,
          errorState.keyword,
        );

      default:
        return _buildInitialState();
    }
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(
            Icons.search,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.searchForYourFavoriteProducts,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            context.l10n.searchHint,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(),
          SizedBox(height: 16),
          Text(
            context.l10n.searching,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(
    List<ProductEntity> products,
    String keyword,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            '${context.l10n.wasFound} ${products.length} ${context.l10n.resultFor} "$keyword"',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _buildProductItem(product);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(String keyword) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '${context.l10n.noResultFound} "$keyword"',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.trySearchWithDeffrentKeys,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    String message,
    String keyword,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.search_error,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<SearchCubit>().refreshSearch();
            },
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(ProductEntity product) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.imgCover ?? '',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
        title: Text(
          product.title ?? 'بدون اسم',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (product.description != null) ...[
              const SizedBox(height: 4),
              Text(
                product.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              '${product.price ?? 0}',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
