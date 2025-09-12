part of 'notifications_list_cubit.dart';

@immutable
sealed class NotificationsListState {}

final class NotificationsListInitial
    extends NotificationsListState {}

final class NotificationsListLoadedState
    extends NotificationsListState {
  final List<NotificationEntity> notifications;
  NotificationsListLoadedState({
    required this.notifications,
  });
}

final class NotificationsListLoadingState
    extends NotificationsListState {}

final class NotificationsListErrorState
    extends NotificationsListState {
  final String message;
  NotificationsListErrorState({required this.message});
}
