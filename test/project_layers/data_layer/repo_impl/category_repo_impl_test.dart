import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/category_remote_data_source.dart';
import 'package:flower_app/project_layers/data_layer/repo_impl/category_repo_impl.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'category_repo_impl_test.mocks.dart';

@GenerateMocks([CategoryRemoteDataSource])
void main() {
  late MockCategoryRemoteDataSource
  mockCategoryRemoteDataSource;
  late CategoryRepoImpl categoryRepoImpl;

  setUp(() {
    mockCategoryRemoteDataSource =
        MockCategoryRemoteDataSource();
    categoryRepoImpl = CategoryRepoImpl(
      mockCategoryRemoteDataSource,
    );
    provideDummy<ApiResult<List<CategoryEntity>>>(
      ApiSuccessResult<List<CategoryEntity>>([]),
    );
  });

  group('CategoryRepoImpl', () {
    final mockCategoryEntities = [
      CategoryEntity(id: '1', name: 'Roses'),
      CategoryEntity(id: '2', name: 'Tulips'),
    ];

    test(
      'should return ApiSuccessResult<List<CategoryEntity>> when getCategories succeeds',
      () async {
        // arrange
        when(
          mockCategoryRemoteDataSource.getCategories(),
        ).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockCategoryEntities),
        );

        // act
        final result = await categoryRepoImpl
            .getCategories();

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
        verify(
          mockCategoryRemoteDataSource.getCategories(),
        ).called(1);
      },
    );

    test(
      'should return ApiErrorResult<List<CategoryEntity>> when getCategories fails',
      () async {
        // arrange
        const mockError = 'Failed to fetch categories';
        when(
          mockCategoryRemoteDataSource.getCategories(),
        ).thenAnswer(
          (_) async => ApiErrorResult(mockError),
        );

        // act
        final result = await categoryRepoImpl
            .getCategories();

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<CategoryEntity>>>(),
        );
        final error =
            result
                as ApiErrorResult<List<CategoryEntity>>;
        expect(error.error, mockError);
        verify(
          mockCategoryRemoteDataSource.getCategories(),
        ).called(1);
      },
    );
  });
}
