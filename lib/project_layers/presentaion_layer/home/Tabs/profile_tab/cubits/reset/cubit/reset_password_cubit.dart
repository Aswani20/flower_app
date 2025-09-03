import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/api_layer/models/request/change_password_request_body.dart';
import 'package:flower_app/project_layers/domain_layer/entities/change_password_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/change_password_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit
    extends Cubit<ResetPasswordState> {
  ChangePasswordUseCase changePasswordUseCase;
  ResetPasswordCubit(this.changePasswordUseCase)
    : super(ResetPasswordInitial());
  Future<void> changePassword(
    ChangePasswordRequestBody body,
  ) async {
    emit(ChangePasswordLoading());
    final result = await changePasswordUseCase.call(body);
    switch (result) {
      case ApiSuccessResult<ChangePasswordEntity>():
        emit(
          ChangePasswordSuccess(
            changePasswordEntity: result.data,
          ),
        );
      case ApiErrorResult<ChangePasswordEntity>():
        emit(
          ChangePasswordError(
            message: result.errorMessage,
          ),
        );
    }
  }
}
