import 'package:bloc/bloc.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/natification_entity.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/get_all_notification_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'notifications_list_state.dart';

@injectable
class NotificationsListCubit
    extends Cubit<NotificationsListState> {
  GetAllNotificationUseCase getAllNotificationUseCase;
  NotificationsListCubit(this.getAllNotificationUseCase)
    : super(NotificationsListInitial());

  Future<void> getNotifications() async {
    emit(NotificationsListLoadingState());
    final result = await getAllNotificationUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<NotificationEntity>>():
        emit(
          NotificationsListLoadedState(
            notifications: result.data,
          ),
        );
      case ApiErrorResult<List<NotificationEntity>>():
        emit(
          NotificationsListErrorState(
            message: result.errorMessage,
          ),
        );
    }
  }
}
