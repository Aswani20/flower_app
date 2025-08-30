import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/data_source_impl/product_remote_data_source_impl.dart';
import 'package:flower_app/project_layers/api_layer/models/products_response.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'category_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late ProductRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = ProductRemoteDataSourceImpl(
      mockApiClient,
    );
  });

  group('ProductRemoteDataSourceImpl', () {
    test(
      'returns ApiSuccessResult when getProducts is successful with categoryId',
      () async {
        // arrange
        final mockResponse = ProductsResponse(
          products: [
            ProductDTO(
              id: '1',
              title: 'Red Rose',
              price: 10.0,
            ),
            ProductDTO(
              id: '2',
              title: 'White Tulip',
              price: 15.0,
            ),
          ],
        );
        const categoryId = 'cat1';
        when(
          mockApiClient.getProductsById(categoryId),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await dataSource.getProducts(
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
          mockApiClient.getProductsById(categoryId),
        ).called(1);
      },
    );

    test(
      'returns ApiSuccessResult when getProducts is successful with null categoryId',
      () async {
        // arrange
        final mockResponse = ProductsResponse(
          products: [
            ProductDTO(
              id: '1',
              title: 'Red Rose',
              price: 10.0,
            ),
          ],
        );
        when(
          mockApiClient.getProductsById(null),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await dataSource.getProducts(null);

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
          mockApiClient.getProductsById(null),
        ).called(1);
      },
    );

    test(
      'returns ApiErrorResult when DioException is thrown with message',
      () async {
        // arrange
        final mockErrorMessage =
            'Failed to fetch products';
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: {'message': mockErrorMessage},
          ),
        );
        const categoryId = 'cat1';
        when(
          mockApiClient.getProductsById(categoryId),
        ).thenThrow(dioException);

        // act
        final result = await dataSource.getProducts(
          categoryId,
        );

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<ProductEntity>>>(),
        );
        final error =
            result as ApiErrorResult<List<ProductEntity>>;
        expect(error.error, mockErrorMessage);
        verify(
          mockApiClient.getProductsById(categoryId),
        ).called(1);
      },
    );

    test(
      'returns ApiErrorResult when DioException is thrown without response data',
      () async {
        // arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          message: 'Network error',
        );
        const categoryId = 'cat1';
        when(
          mockApiClient.getProductsById(categoryId),
        ).thenThrow(dioException);

        // act
        final result = await dataSource.getProducts(
          categoryId,
        );

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<ProductEntity>>>(),
        );
        final error =
            result as ApiErrorResult<List<ProductEntity>>;
        expect(error.error, 'Network error');
        verify(
          mockApiClient.getProductsById(categoryId),
        ).called(1);
      },
    );
  });
}
