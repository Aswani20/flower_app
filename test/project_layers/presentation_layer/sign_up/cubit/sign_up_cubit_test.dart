import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/sign_up_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/sign_up_use_case.dart';

import 'sign_up_cubit_test.mocks.dart';

@GenerateMocks([SignUpUseCase])
void main() {
  // ignore: unused_local_variable
  late SignUpCubit signUpCubit;
  late MockSignUpUseCase mockSignUpUseCase;

  setUpAll(() {
    mockSignUpUseCase = MockSignUpUseCase();
    signUpCubit = SignUpCubit(mockSignUpUseCase);
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

  final mockSignUpEntity = SignUpEntity(
    email: 'john@example.com',
    firstName: 'John',
    lastName: 'Doe',
    phone: '1234567890',
  );

  final successResult = ApiSuccessResult<SignUpEntity>(
    mockSignUpEntity,
  );
  final errorResult = ApiErrorResult<SignUpEntity>(
    'Sign up failed',
  );

  blocTest<SignUpCubit, SignUpState>(
    'emits [SignupLoading, SignupSuccess] when signUp succeeds',
    build: () {
      when(
        mockSignUpUseCase.call(any),
      ).thenAnswer((_) async => successResult);
      final cubit = SignUpCubit(mockSignUpUseCase);
      cubit.emailController.text = 'john@example.com';
      cubit.passwordController.text = 'password123';
      cubit.confirmPasswordController.text =
          'password123';
      cubit.firstNameController.text = 'John';
      cubit.lastNameController.text = 'Doe';
      cubit.phoneNumberController.text = '1234567890';
      cubit.selectedGender = 'Male';
      return cubit;
    },
    act: (cubit) => cubit.signUp(),
    expect: () => [
      isA<SignupLoading>(),
      predicate(
        (state) =>
            state is SignupSuccess &&
            state.response.firstName ==
                mockSignUpEntity.firstName,
      ),
    ],
  );

  blocTest<SignUpCubit, SignUpState>(
    'emits [SignupLoading, SignupError] when signUp fails',
    build: () {
      when(
        mockSignUpUseCase.call(any),
      ).thenAnswer((_) async => errorResult);
      final cubit = SignUpCubit(mockSignUpUseCase);
      cubit.emailController.text = 'john@example.com';
      cubit.passwordController.text = 'password123';
      cubit.confirmPasswordController.text =
          'password123';
      cubit.firstNameController.text = 'John';
      cubit.lastNameController.text = 'Doe';
      cubit.phoneNumberController.text = '1234567890';
      cubit.selectedGender = 'Male';
      return cubit;
    },
    act: (cubit) => cubit.signUp(),
    expect: () => [
      isA<SignupLoading>(),
      predicate(
        (state) =>
            state is SignupError &&
            state.message == 'Sign up failed',
      ),
    ],
  );
}
