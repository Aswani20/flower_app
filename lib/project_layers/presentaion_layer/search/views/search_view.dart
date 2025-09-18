import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/cubit/search_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/widgets/search_bar.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/widgets/search_empty_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/widgets/search_error_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/widgets/search_initial.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/widgets/search_loading_widget.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/widgets/search_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController =
      TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(context.l10n.search),
      ),

      body: Column(
        children: [
          SearchViewBar(
            controller: _searchController,
            focusNode: _searchFocusNode,
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) =>
                  _buildSearchContent(state),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchContent(SearchState state) {
    return switch (state) {
      SearchInitial() => const SearchInitialView(),
      SearchLoading() => const SearchLoadingView(),
      SearchSuccess s => SearchSuccessView(
        products: s.products,
        keyword: s.keyword,
      ),
      SearchEmpty e => SearchEmptyView(
        keyword: e.keyword,
      ),
      SearchError e => SearchErrorView(
        message: e.message,
        keyword: e.keyword,
      ),
      // ignore: unreachable_switch_case
      _ => const SearchInitialView(),
    };
  }
}
