import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_filter.dart';
import 'package:flower_app/project_layers/domain_layer/repos/product_repo.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/product_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'product_use_case_test.mocks.dart';

@GenerateMocks([ProductRepo])
void main() {
  late MockProductRepo mockProductRepo;
  late ProductUseCase productUseCase;

  setUp(() {
    mockProductRepo = MockProductRepo();
    productUseCase = ProductUseCase(mockProductRepo);
    provideDummy<ApiResult<List<ProductEntity>>>(
      ApiSuccessResult<List<ProductEntity>>([]),
    );
  });

  group('ProductUseCase', () {
    final mockProductEntities = [
      ProductEntity(
        id: '1',
        title: 'Red Rose',
        category: 'cat1',
        price: 10.0,
      ),
      ProductEntity(
        id: '2',
        title: 'White Tulip',
        category: 'cat1',
        price: 15.0,
      ),
    ];

    test(
      'should return ApiSuccessResult<List<ProductEntity>> when getProducts succeeds with categoryId',
      () async {
        // arrange
        const categoryId = 'cat1';
        final filter = ProductFilter(
          categoryId: categoryId,
        );
        when(
          mockProductRepo.getProducts(filter),
        ).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockProductEntities),
        );

        // act
        final result = await productUseCase.call(filter);

        // assert
        expect(
          result,
          isA<ApiSuccessResult<List<ProductEntity>>>(),
        );
        final products =
            (result
                    as ApiSuccessResult<
                      List<ProductEntity>
                    >)
                .data;
        expect(products.length, 2);
        expect(products[0].title, 'Red Rose');
        expect(products[1].title, 'White Tulip');
        verify(
          mockProductRepo.getProducts(filter),
        ).called(1);
      },
    );

    test(
      'should return ApiSuccessResult<List<ProductEntity>> when getProducts succeeds with null categoryId',
      () async {
        // arrange
        final mockSingleProduct = [
          ProductEntity(
            id: '1',
            title: 'Red Rose',
            category: null,
            price: 10.0,
          ),
        ];
        const categoryId = 'cat1';
        final filter = ProductFilter(
          categoryId: categoryId,
        );
        when(
          mockProductRepo.getProducts(filter),
        ).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockSingleProduct),
        );

        // act
        final result = await productUseCase.call(filter);

        // assert
        expect(
          result,
          isA<ApiSuccessResult<List<ProductEntity>>>(),
        );
        final products =
            (result
                    as ApiSuccessResult<
                      List<ProductEntity>
                    >)
                .data;
        expect(products.length, 1);
        expect(products[0].title, 'Red Rose');
        verify(
          mockProductRepo.getProducts(filter),
        ).called(1);
      },
    );

    test(
      'should return ApiErrorResult<List<ProductEntity>> when getProducts fails',
      () async {
        // arrange
        const mockError = 'Failed to fetch products';
        const categoryId = 'cat1';
        final filter = ProductFilter(
          categoryId: categoryId,
        );
        when(
          mockProductRepo.getProducts(filter),
        ).thenAnswer(
          (_) async => ApiErrorResult(mockError),
        );

        // act
        final result = await productUseCase.call(filter);

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<ProductEntity>>>(),
        );
        final error =
            result as ApiErrorResult<List<ProductEntity>>;
        expect(error.errorMessage, mockError);
        verify(
          mockProductRepo.getProducts(filter),
        ).called(1);
      },
    );
  });
}
