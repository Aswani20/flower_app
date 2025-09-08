import 'package:flower_app/project_layers/data_layer/repos_impl/sign_up_repo_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/data_layer/data_source/sign_up_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';

import 'sign_up_repo_impl_test.mocks.dart';

@GenerateMocks([SignUpRemoteDataSource])
void main() {
  late MockSignUpRemoteDataSource
  mockSignUpRemoteDataSource;
  late SignUpRepoImpl signUpRepoImpl;

  setUp(() {
    mockSignUpRemoteDataSource =
        MockSignUpRemoteDataSource();
    signUpRepoImpl = SignUpRepoImpl(
      mockSignUpRemoteDataSource,
    );
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

  group('SignUpRepoImpl', () {
    const mockFirstName = 'John';
    const mockLastName = 'Doe';
    const mockEmail = 'john@example.com';
    const mockPassword = 'password123';
    const mockRePassword = 'password123';
    const mockPhone = '1234567890';

    final mockRequestBody = SignUpRequestBody(
      email: mockEmail,
      password: mockPassword,
      rePassword: mockRePassword,
      firstName: mockFirstName,
      lastName: mockLastName,
      phone: mockPhone,
    );

    final mockSignUpEntity = SignUpEntity(
      email: mockEmail,
      firstName: mockFirstName,
      lastName: '',
      phone: '',
    );

    test(
      'should return ApiSuccessResult<SignUpEntity> when sign up succeeds',
      () async {
        // arrange
        when(
          mockSignUpRemoteDataSource.signUp(
            mockRequestBody,
          ),
        ).thenAnswer(
          (_) async => ApiSuccessResult(mockSignUpEntity),
        );

        // act
        final result = await signUpRepoImpl.signUp(
          mockRequestBody,
        );

        // assert
        expect(
          result,
          isA<ApiSuccessResult<SignUpEntity>>(),
        );
        result as ApiSuccessResult<SignUpEntity>;
        expect(result.data.firstName, mockFirstName);
      },
    );

    test(
      'should return ApiErrorResult<SignUpEntity> when sign up fails',
      () async {
        // arrange
        const mockError = 'Sign up failed';
        when(
          mockSignUpRemoteDataSource.signUp(any),
        ).thenAnswer(
          (_) async => ApiErrorResult(mockError),
        );

        // act
        final result = await signUpRepoImpl.signUp(
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
