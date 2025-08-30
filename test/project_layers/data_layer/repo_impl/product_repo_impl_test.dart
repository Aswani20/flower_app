import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/product_remote_data_source.dart';
import 'package:flower_app/project_layers/data_layer/repo_impl/product_repo_impl.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'product_repo_impl_test.mocks.dart';

@GenerateMocks([ProductRemoteDataSource])
void main() {
  late MockProductRemoteDataSource
  mockProductRemoteDataSource;
  late ProductRepoImpl productRepoImpl;

  setUp(() {
    mockProductRemoteDataSource =
        MockProductRemoteDataSource();
    productRepoImpl = ProductRepoImpl(
      mockProductRemoteDataSource,
    );
    provideDummy<ApiResult<List<ProductEntity>>>(
      ApiSuccessResult<List<ProductEntity>>([]),
    );
  });

  group('ProductRepoImpl', () {
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
        when(
          mockProductRemoteDataSource.getProducts(
            categoryId,
          ),
        ).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockProductEntities),
        );

        // act
        final result = await productRepoImpl.getProducts(
          categoryId,
        );

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
          mockProductRemoteDataSource.getProducts(
            categoryId,
          ),
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
        when(
          mockProductRemoteDataSource.getProducts(null),
        ).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockSingleProduct),
        );

        // act
        final result = await productRepoImpl.getProducts(
          null,
        );

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
          mockProductRemoteDataSource.getProducts(null),
        ).called(1);
      },
    );

    test(
      'should return ApiErrorResult<List<ProductEntity>> when getProducts fails',
      () async {
        // arrange
        const mockError = 'Failed to fetch products';
        const categoryId = 'cat1';
        when(
          mockProductRemoteDataSource.getProducts(
            categoryId,
          ),
        ).thenAnswer(
          (_) async => ApiErrorResult(mockError),
        );

        // act
        final result = await productRepoImpl.getProducts(
          categoryId,
        );

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<ProductEntity>>>(),
        );
        final error =
            result as ApiErrorResult<List<ProductEntity>>;
        expect(error.error, mockError);
        verify(
          mockProductRemoteDataSource.getProducts(
            categoryId,
          ),
        ).called(1);
      },
    );
  });
}
