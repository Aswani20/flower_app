import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/usecase/category_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/usecase/product_use_case.dart';
import 'package:flower_app/project_layers/presentation_layer/home/Tabs/category_tab/cubit/category_cubit.dart';
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
      'emits [CategoryLoading, CategoryLoaded, ProductLoading, ProductLoaded] when getCategories succeeds and getProducts is called',
      build: () {
        when(mockCategoryUseCase.call()).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockCategoryEntities),
        );
        when(mockProductUseCase.call('1')).thenAnswer(
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
              state.categories?.length == 2 &&
              state.categories?[0].name == 'Roses' &&
              state.categories?[1].name == 'Tulips',
        ),
        isA<ProductLoading>(),
        predicate(
          (state) =>
              state is ProductLoaded &&
              state.products?.length == 2 &&
              state.products?[0].title == 'Red Rose' &&
              state.products?[1].title == 'White Tulip',
        ),
      ],
      verify: (_) {
        verify(mockCategoryUseCase.call()).called(1);
        verify(mockProductUseCase.call('1')).called(1);
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
      'emits [ProductLoading, ProductLoaded] when getProducts succeeds',
      build: () {
        when(mockProductUseCase.call('1')).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockProductEntities),
        );
        return categoryCubit;
      },
      act: (cubit) => cubit.getProducts('1'),
      expect: () => [
        isA<ProductLoading>(),
        predicate(
          (state) =>
              state is ProductLoaded &&
              state.products?.length == 2 &&
              state.products?[0].title == 'Red Rose' &&
              state.products?[1].title == 'White Tulip',
        ),
      ],
      verify: (_) {
        verify(mockProductUseCase.call('1')).called(1);
      },
    );

    blocTest<CategoryCubit, CategoryState>(
      'emits [ProductLoading, ProductError] when getProducts fails',
      build: () {
        when(mockProductUseCase.call('1')).thenAnswer(
          (_) async =>
              ApiErrorResult('Failed to fetch products'),
        );
        return categoryCubit;
      },
      act: (cubit) => cubit.getProducts('1'),
      expect: () => [
        isA<ProductLoading>(),
        predicate(
          (state) =>
              state is ProductError &&
              state.message == 'Failed to fetch products',
        ),
      ],
      verify: (_) {
        verify(mockProductUseCase.call('1')).called(1);
      },
    );
  });
}
