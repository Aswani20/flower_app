import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/category_repo.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/category_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'category_use_case_test.mocks.dart';

@GenerateMocks([CategoryRepo])
void main() {
  late MockCategoryRepo mockCategoryRepo;
  late CategoryUseCase categoryUseCase;

  setUp(() {
    mockCategoryRepo = MockCategoryRepo();
    categoryUseCase = CategoryUseCase(mockCategoryRepo);
    provideDummy<ApiResult<List<CategoryEntity>>>(
      ApiSuccessResult<List<CategoryEntity>>([]),
    );
  });

  group('CategoryUseCase', () {
    final mockCategoryEntities = [
      CategoryEntity(id: '1', name: 'Roses'),
      CategoryEntity(id: '2', name: 'Tulips'),
    ];

    test(
      'should return ApiSuccessResult<List<CategoryEntity>> when getCategories succeeds',
      () async {
        // arrange
        when(
          mockCategoryRepo.getAllCategories(),
        ).thenAnswer(
          (_) async =>
              ApiSuccessResult(mockCategoryEntities),
        );

        // act
        final result = await categoryUseCase.call();

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
          mockCategoryRepo.getAllCategories(),
        ).called(1);
      },
    );

    test(
      'should return ApiErrorResult<List<CategoryEntity>> when getCategories fails',
      () async {
        // arrange
        const mockError = 'Failed to fetch categories';
        when(
          mockCategoryRepo.getAllCategories(),
        ).thenAnswer(
          (_) async => ApiErrorResult(mockError),
        );

        // act
        final result = await categoryUseCase.call();

        // assert
        expect(
          result,
          isA<ApiErrorResult<List<CategoryEntity>>>(),
        );
        final error =
            result
                as ApiErrorResult<List<CategoryEntity>>;
        expect(error.errorMessage, mockError);
        verify(
          mockCategoryRepo.getAllCategories(),
        ).called(1);
      },
    );
  });
}
