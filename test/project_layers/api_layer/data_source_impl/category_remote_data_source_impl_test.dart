import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/data_source_impl/category_remote_data_source_impl.dart';
import 'package:flower_app/project_layers/api_layer/models/categories_response.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'category_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late CategoryRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = CategoryRemoteDataSourceImpl(
      mockApiClient,
    );
  });

  group('CategoryRemoteDataSourceImpl', () {
    test(
      'returns ApiSuccessResult when getCategories is successful',
      () async {
        // arrange
        final mockResponse = CategoriesResponse(
          categories: [
            CategoryDTO(id: '1', name: 'Roses'),
            CategoryDTO(id: '2', name: 'Tulips'),
          ],
        );
        when(
          mockApiClient.getCategories(),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await dataSource.getCategories();

        // assert
        expect(
          result,
          isA<ApiSuccessResult<List<CategoryEntity>>>(),
        );
        final categories =
            (result
                    as ApiSuccessResult<
                      List<CategoryEntity>
                    >)
                .data;
        expect(categories.length, 2);
        expect(categories[0].name, 'Roses');
        expect(categories[1].name, 'Tulips');
        verify(mockApiClient.getCategories()).called(1);
      },
    );

    test(
      'returns ApiErrorResult when DioException is thrown with message',
      () async {
        // arrange
        final mockErrorMessage =
            'Failed to fetch categories';
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: {'message': mockErrorMessage},
          ),
        );
        when(
          mockApiClient.getCategories(),
        ).thenThrow(dioException);

        // act
        final result = await dataSource.getCategories();

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<CategoryEntity>>>(),
        );
        final error =
            result
                as ApiErrorResult<List<CategoryEntity>>;
        expect(error.error, mockErrorMessage);
        verify(mockApiClient.getCategories()).called(1);
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
        when(
          mockApiClient.getCategories(),
        ).thenThrow(dioException);

        // act
        final result = await dataSource.getCategories();

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<CategoryEntity>>>(),
        );
        final error =
            result
                as ApiErrorResult<List<CategoryEntity>>;
        expect(error.error, 'Network error');
        verify(mockApiClient.getCategories()).called(1);
      },
    );
  });
}
