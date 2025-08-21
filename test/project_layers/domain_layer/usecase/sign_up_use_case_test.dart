import 'package:flower_app/project_layers/domain_layer/usecase/sign_up_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/sign_up_repo.dart';

import 'sign_up_use_case_test.mocks.dart';

@GenerateMocks([SignUpRepo])
void main() {
  late SignUpUseCase signUpUseCase;
  late MockSignUpRepo mockSignUpRepo;

  setUp(() {
    mockSignUpRepo = MockSignUpRepo();
    signUpUseCase = SignUpUseCase(mockSignUpRepo);
    provideDummy<ApiResult<SignUpEntity>>(
      ApiSuccessResult<SignUpEntity>(
        SignUpEntity(
          email: '',
          firstName: '',
          lastName: '',
          phone: '',
        ),
      ),
    );
  });

  group('SignUpUseCase', () {
    final mockRequestBody = SignUpRequestBody(
      email: 'john@example.com',
      password: 'password123',
      rePassword: 'password123',
      firstName: 'John',
      lastName: 'Doe',
      phone: '1234567890',
    );

    final mockSignUpEntity = SignUpEntity(
      email: 'john@example.com',
      firstName: 'John',
      lastName: 'Doe',
      phone: '1234567890',
    );

    test(
      'should return ApiSuccessResult<SignUpEntity> when sign up succeeds',
      () async {
        // arrange
        when(
          mockSignUpRepo.signUp(mockRequestBody),
        ).thenAnswer(
          (_) async => ApiSuccessResult<SignUpEntity>(
            mockSignUpEntity,
          ),
        );

        // act
        final result = await signUpUseCase.call(
          mockRequestBody,
        );

        // assert
        expect(
          result,
          isA<ApiSuccessResult<SignUpEntity>>(),
        );
        result as ApiSuccessResult<SignUpEntity>;
        expect(result.data.firstName, 'John');
      },
    );

    test(
      'should return ApiErrorResult<SignUpEntity> when sign up fails',
      () async {
        // arrange
        const mockError = 'Sign up failed';
        when(mockSignUpRepo.signUp(any)).thenAnswer(
          (_) async =>
              ApiErrorResult<SignUpEntity>(mockError),
        );

        // act
        final result = await signUpUseCase.call(
          mockRequestBody,
        );

        // assert
        expect(
          result,
          isA<ApiErrorResult<SignUpEntity>>(),
        );
        result as ApiErrorResult<SignUpEntity>;
        expect(result.errorMessage, mockError);
      },
    );
  });
}
