import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/data_source/product_remote_data_source_impl.dart';
import 'package:flower_app/project_layers/api_layer/models/products_response.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:dio/dio.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_filter.dart';
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
        Map<String, dynamic> categoryId = {
          'category': '1',
        };
        when(
          mockApiClient.getProductsByIdf(categoryId),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await dataSource.getProducts(
          ProductFilter(categoryId: '1'),
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
          mockApiClient.getProductsByIdf(categoryId),
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
          mockApiClient.getProductsByIdf(null),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await dataSource.getProducts(
          ProductFilter(categoryId: null),
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
          mockApiClient.getProductsByIdf(null),
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
        Map<String, dynamic> categoryId = {
          'category': '1',
        };

        when(
          mockApiClient.getProductsByIdf(categoryId),
        ).thenThrow(dioException);

        // act
        final result = await dataSource.getProducts(
          ProductFilter(categoryId: '1'),
        );

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<ProductEntity>>>(),
        );
        final error =
            result as ApiErrorResult<List<ProductEntity>>;
        expect(error.errorMessage, mockErrorMessage);
        verify(
          mockApiClient.getProductsByIdf(categoryId),
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
        Map<String, dynamic> categoryId = {
          'category': '1',
        };
        when(
          mockApiClient.getProductsByIdf(categoryId),
        ).thenThrow(dioException);

        // act
        final result = await dataSource.getProducts(
          ProductFilter(categoryId: '1'),
        );

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<ProductEntity>>>(),
        );
        final error =
            result as ApiErrorResult<List<ProductEntity>>;
        expect(error.errorMessage, 'Network error');
        verify(
          mockApiClient.getProductsByIdf(categoryId),
        ).called(1);
      },
    );
  });
}
