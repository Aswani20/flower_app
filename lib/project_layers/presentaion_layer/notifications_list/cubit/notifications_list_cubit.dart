import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notifications_list_state.dart';

class NotificationsListCubit extends Cubit<NotificationsListState> {
  NotificationsListCubit() : super(NotificationsListInitial());
}
