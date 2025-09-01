import 'package:flower_app/project_layers/data_layer/data_source/login_data_source.dart';
import 'package:flower_app/project_layers/data_layer/repos_impl/login_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flower_app/project_layers/api_layer/models/request/login_request.dart';
import 'package:flower_app/project_layers/api_layer/models/response/login_response.dart';
import 'package:flower_app/core/errors/failures.dart';

import 'login_repo_impl_test.mocks.dart';

@GenerateMocks([LoginDataSource])
void main() {
  late MockLoginDataSource mockDataSource;
  late LoginRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockLoginDataSource();
    repository = LoginRepositoryImpl(mockDataSource);
  });

  final tRequest = LoginRequest(
    email: "marwan@gmail.com",
    password: "123456",
  );
  final tResponse = LoginResponse(
    token: "token123",
    message: "Success",
  );

  group("LoginRepositoryImpl", () {
    test(
      "should return Right(LoginResponse) when login is successful",
      () async {
        // arrange
        when(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).thenAnswer((_) async => tResponse);

        // act
        final result = await repository.login(
          request: tRequest,
        );

        // assert
        expect(result.isRight(), true);
        expect(
          result.getOrElse(() => tResponse).token,
          tResponse.token,
        );
        verify(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).called(1);
      },
    );

    test(
      "should return Left(ServerError) when credentials invalid",
      () async {
        // arrange
        when(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).thenThrow(
          ServerError(
            errorMessage: "Invalid credentials",
          ),
        );

        // act
        final result = await repository.login(
          request: tRequest,
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) =>
              expect(failure, isA<ServerError>()),
          (_) => fail("Expected Left(ServerError)"),
        );
        verify(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).called(1);
      },
    );

    test(
      "should return Left(NetworkError) when network fails",
      () async {
        // arrange
        when(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).thenThrow(
          NetworkError(errorMessage: "No internet"),
        );

        // act
        final result = await repository.login(
          request: tRequest,
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) =>
              expect(failure, isA<NetworkError>()),
          (_) => fail("Expected Left(NetworkError)"),
        );
        verify(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).called(1);
      },
    );

    test(
      "should return Left(ServerError) when server fails",
      () async {
        // arrange
        when(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).thenThrow(
          ServerError(errorMessage: "Server down"),
        );

        // act
        final result = await repository.login(
          request: tRequest,
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) =>
              expect(failure, isA<ServerError>()),
          (_) => fail("Expected Left(ServerError)"),
        );
        verify(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).called(1);
      },
    );

    test(
      "should return Left(UserError) for unexpected exceptions",
      () async {
        // arrange
        when(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).thenThrow(Exception("Unexpected"));

        // act
        final result = await repository.login(
          request: tRequest,
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<UserError>()),
          (_) => fail("Expected Left(UserError)"),
        );
        verify(
          mockDataSource.login(
            request: anyNamed('request'),
          ),
        ).called(1);
      },
    );
  });
}
