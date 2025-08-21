import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/domain_layer/usecase/login_usecase/login_usecase.dart';
import 'package:flower_app/project_layers/domain_layer/repos/login_repo/login_repo.dart';
import 'package:flower_app/project_layers/api_layer/requests/login_request/login_request.dart';
import 'package:flower_app/project_layers/api_layer/responses/login_response/login_response.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])

void main() {
  late MockLoginRepository mockRepository;
  late LoginUseCase useCase;

  setUp(() {
    mockRepository = MockLoginRepository();
    useCase = LoginUseCase(loginRepository: mockRepository);
  });

  final tRequest = LoginRequest(email: "marwan@gmail.com", password: "123456");
  final tResponse = LoginResponse(token: "token123", message: "Success");

  group("LoginUseCase", () {
    test("should return Right(LoginResponse) when repository returns success", () async {
      // arrange
      when(mockRepository.login(request: tRequest))
          .thenAnswer((_) async => Right(tResponse));

      // act
      final result = await useCase.call(response: tRequest);

      // assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => tResponse).token, tResponse.token);
      verify(mockRepository.login(request: tRequest)).called(1);
    });

    test("should return Left(ServerError) when repository returns ServerError", () async {
      // arrange
      when(mockRepository.login(request: tRequest))
          .thenAnswer((_) async => Left(ServerError(errorMessage: "Invalid credentials")));

      // act
      final result = await useCase.call(response: tRequest);

      // assert
      expect(result.isLeft(), true);
      result.fold(
            (failure) => expect(failure, isA<ServerError>()),
            (_) => fail("Expected Left(ServerError)"),
      );
      verify(mockRepository.login(request: tRequest)).called(1);
    });

    test("should return Left(NetworkError) when repository returns NetworkError", () async {
      // arrange
      when(mockRepository.login(request: tRequest))
          .thenAnswer((_) async => Left(NetworkError(errorMessage: "No internet")));

      // act
      final result = await useCase.call(response: tRequest);

      // assert
      expect(result.isLeft(), true);
      result.fold(
            (failure) => expect(failure, isA<NetworkError>()),
            (_) => fail("Expected Left(NetworkError)"),
      );
      verify(mockRepository.login(request: tRequest)).called(1);
    });

    test("should return Left(UserError) when repository returns UserError", () async {
      // arrange
      when(mockRepository.login(request: tRequest))
          .thenAnswer((_) async => Left(UserError(errorMessage: "Unexpected error")));

      // act
      final result = await useCase.call(response: tRequest);

      // assert
      expect(result.isLeft(), true);
      result.fold(
            (failure) => expect(failure, isA<UserError>()),
            (_) => fail("Expected Left(UserError)"),
      );
      verify(mockRepository.login(request: tRequest)).called(1);
    });
  });
}
