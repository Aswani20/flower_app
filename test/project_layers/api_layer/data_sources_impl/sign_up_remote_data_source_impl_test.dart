import 'package:flower_app/project_layers/api_layer/data_sources_impl/sign_up_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/client/api_client/api_client.dart';
import 'package:flower_app/project_layers/api_layer/models/request/sign_up_request.dart';
import 'package:flower_app/project_layers/api_layer/models/response/sign_up_response.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';

import 'sign_up_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late SignUpRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = SignUpRemoteDataSourceImpl(
      mockApiClient,
    );
  });

  group('SignUpRemoteDataSourceImpl', () {
    test(
      'returns ApiSuccessResult when sign up is successful',
      () async {
        // arrange
        final mockResponse = SignUpResponse(
          user: UserDto(
            id: '1',
            email: 'test@mail.com',
            firstName: 'Test',
            lastName: 'User',
          ),
        );

        final requestBody = SignUpRequestBody(
          email: 'test@mail.com',
          password: '12345678',
          rePassword: '12345678',
          firstName: 'Test',
          lastName: 'User',
          phone: '123456789',
        );

        when(
          mockApiClient.signUp(requestBody),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await dataSource.signUp(
          requestBody,
        );

        // assert
        expect(
          result,
          isA<ApiSuccessResult<SignUpEntity>>(),
        );
        final user =
            (result as ApiSuccessResult<SignUpEntity>)
                .data;
        expect(user.firstName, 'Test');
        expect(user.email, 'test@mail.com');
        verify(
          mockApiClient.signUp(requestBody),
        ).called(1);
      },
    );

    test(
      'returns ApiErrorResult when DioException is thrown with message',
      () async {
        // arrange
        final mockErrorMessage = 'Something went wrong';
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: {'message': mockErrorMessage},
          ),
        );

        final requestBody = SignUpRequestBody(
          email: 'test@mail.com',
          password: '12345678',
          rePassword: '12345678',
          firstName: 'Test',
          lastName: 'User',
          phone: '123456789',
        );

        when(
          mockApiClient.signUp(requestBody),
        ).thenThrow(dioException);

        // act
        final result = await dataSource.signUp(
          requestBody,
        );

        // assert
        expect(
          result,
          isA<ApiErrorResult<SignUpEntity>>(),
        );
        final error =
            result as ApiErrorResult<SignUpEntity>;
        expect(error.errorMessage, mockErrorMessage);
      },
    );
  });
}
