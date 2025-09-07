import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_filter.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/category_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/product_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/cubit/category_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_cubit_test.mocks.dart';

@GenerateMocks([CategoryUseCase, ProductUseCase])
void main() {
  late CategoryCubit categoryCubit;
  late MockCategoryUseCase mockCategoryUseCase;
  late MockProductUseCase mockProductUseCase;

  setUp(() {
    mockCategoryUseCase = MockCategoryUseCase();
    mockProductUseCase = MockProductUseCase();
    categoryCubit = CategoryCubit(
      mockCategoryUseCase,
      mockProductUseCase,
    );
    provideDummy<ApiResult<List<CategoryEntity>>>(
      ApiSuccessResult<List<CategoryEntity>>([]),
    );
    provideDummy<ApiResult<List<ProductEntity>>>(
      ApiSuccessResult<List<ProductEntity>>([]),
    );
  });

  final mockCategoryEntities = [
    CategoryEntity(id: '0', name: 'All'),
    CategoryEntity(id: '1', name: 'Roses'),
    CategoryEntity(id: '2', name: 'Tulips'),
  ];

  final mockProductEntities = [
    ProductEntity(
      id: '1',
      title: 'Red Rose',
      category: '1',
      price: 10.0,
    ),
    ProductEntity(
      id: '2',
      title: 'White Tulip',
      category: '1',
      price: 15.0,
    ),
  ];

  group('CategoryCubit', () {
    blocTest<CategoryCubit, CategoryState>(
      'emits [CategoryLoading, CategoryLoaded, ProductLoading, ProductLoaded] when getCategories succeeds and getProducts is called for the first category',
      build: () {
        when(mockCategoryUseCase.call()).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockCategoryEntities),
        );
        when(mockProductUseCase.call(any)).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockProductEntities),
        );
        return categoryCubit;
      },
      act: (cubit) => cubit.getCategories(),
      expect: () => [
        isA<CategoryLoading>(),
        predicate(
          (state) =>
              state is CategoryLoaded &&
              state.categories?.length == 3,
        ),
        isA<ProductLoading>(),
        predicate(
          (state) =>
              state is ProductLoaded &&
              state.products?.length == 2,
        ),
      ],
      verify: (_) {
        verify(mockCategoryUseCase.call()).called(1);
        verify(
          mockProductUseCase.call(
            argThat(
              isA<ProductFilter>()
                  .having(
                    (f) => f.categoryId,
                    'categoryId',
                    '0',
                  )
                  .having(
                    (f) => f.filter,
                    'filter',
                    'New',
                  ),
            ),
          ),
        ).called(1);
      },
    );

    blocTest<CategoryCubit, CategoryState>(
      'emits [CategoryLoading, CategoryError] when getCategories fails',
      build: () {
        when(mockCategoryUseCase.call()).thenAnswer(
          (_) async => ApiErrorResult(
            'Failed to fetch categories',
          ),
        );
        return categoryCubit;
      },
      act: (cubit) => cubit.getCategories(),
      expect: () => [
        isA<CategoryLoading>(),
        predicate(
          (state) =>
              state is CategoryError &&
              state.message ==
                  'Failed to fetch categories',
        ),
      ],
      verify: (_) {
        verify(mockCategoryUseCase.call()).called(1);
        verifyNever(mockProductUseCase.call(any));
      },
    );

    blocTest<CategoryCubit, CategoryState>(
      'emits [ProductLoading, ProductLoaded] when getProducts succeeds with a filter',
      build: () {
        when(mockProductUseCase.call(any)).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockProductEntities),
        );
        return categoryCubit;
      },
      act: (cubit) => cubit.getProducts(
        ProductFilter(categoryId: '1', filter: 'Popular'),
      ),
      expect: () => [
        isA<ProductLoading>(),
        predicate(
          (state) =>
              state is ProductLoaded &&
              state.products?.length == 2,
        ),
      ],
      verify: (_) {
        verify(
          mockProductUseCase.call(
            argThat(
              isA<ProductFilter>()
                  .having(
                    (f) => f.categoryId,
                    'categoryId',
                    '1',
                  )
                  .having(
                    (f) => f.filter,
                    'filter',
                    'Popular',
                  ),
            ),
          ),
        ).called(1);
      },
    );

    blocTest<CategoryCubit, CategoryState>(
      'emits [ProductLoading, ProductError] when getProducts fails',
      build: () {
        when(mockProductUseCase.call(any)).thenAnswer(
          (_) async =>
              ApiErrorResult('Failed to fetch products'),
        );
        return categoryCubit;
      },
      act: (cubit) => cubit.getProducts(
        ProductFilter(categoryId: '1'),
      ),
      expect: () => [
        isA<ProductLoading>(),
        predicate(
          (state) =>
              state is ProductError &&
              state.message == 'Failed to fetch products',
        ),
      ],
      verify: (_) {
        verify(mockProductUseCase.call(any)).called(1);
      },
    );

    blocTest<CategoryCubit, CategoryState>(
      'calls getProducts with the correct filter when updateFilter is called',
      setUp: () {
        categoryCubit.currentCategories =
            mockCategoryEntities;
        categoryCubit.selectedTabIndex =
            1; // Assuming 'Roses' is selected
        when(mockProductUseCase.call(any)).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockProductEntities),
        );
      },
      build: () => categoryCubit,
      act: (cubit) => cubit.updateFilter('Old'),
      verify: (_) {
        verify(
          mockProductUseCase.call(
            argThat(
              isA<ProductFilter>()
                  .having(
                    (f) => f.categoryId,
                    'categoryId',
                    '1',
                  )
                  .having(
                    (f) => f.filter,
                    'filter',
                    'Old',
                  ),
            ),
          ),
        ).called(1);
      },
    );

    blocTest<CategoryCubit, CategoryState>(
      'calls getProducts with the correct categoryId when updateSelectedTab is called',
      setUp: () {
        categoryCubit.currentCategories =
            mockCategoryEntities;
        categoryCubit.selectedFilter = 'New';
        when(mockProductUseCase.call(any)).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockProductEntities),
        );
      },
      build: () => categoryCubit,
      act: (cubit) =>
          cubit.updateSelectedTab(2), // Tulips category
      verify: (_) {
        verify(
          mockProductUseCase.call(
            argThat(
              isA<ProductFilter>()
                  .having(
                    (f) => f.categoryId,
                    'categoryId',
                    '2',
                  )
                  .having(
                    (f) => f.filter,
                    'filter',
                    'New',
                  ),
            ),
          ),
        ).called(1);
      },
    );
  });
}
