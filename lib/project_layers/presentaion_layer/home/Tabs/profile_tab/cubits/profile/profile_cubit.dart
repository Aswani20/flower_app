import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/get_logged_user_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/change_password_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/get_logged_user_data_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  GetLoggedUserDataUseCase getLoggedUserDataUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  ProfileCubit(
    this.getLoggedUserDataUseCase,
    this.changePasswordUseCase,
  ) : super(ProfileInitial());

  Future<void> getLoggedUserData() async {
    emit(GetLoggedUserDataLoading());
    final result = await getLoggedUserDataUseCase.call();
    switch (result) {
      case ApiSuccessResult<GetLoggedUserEntity>():
        emit(GetLoggedUserDataSuccess(user: result.data));
        break;

      case ApiErrorResult<GetLoggedUserEntity>():
        emit(
          GetLoggedUserDataError(
            message: result.errorMessage,
          ),
        );
        break;
    }
  }
}
