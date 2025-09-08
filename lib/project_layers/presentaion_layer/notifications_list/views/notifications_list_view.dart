import 'package:flower_app/project_layers/presentaion_layer/notifications_list/cubit/notifications_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body:
          BlocBuilder<
            NotificationsListCubit,
            NotificationsListState
          >(
            builder: (context, state) {
              if (state is NotificationsListLoadedState) {
                if (state.notifications.isEmpty) {
                  return const Center(
                    child: Text("No Notifications"),
                  );
                }
                return ListView.builder(
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    final notification =
                        state.notifications[index];
                    return ListTile(
                      title: Text(
                        notification.title ?? '',
                      ),
                      subtitle: Text(
                        notification.body ?? '',
                      ),
                    );
                  },
                );
              } else if (state
                  is NotificationsListErrorState) {
                return Center(child: Text(state.message));
              } else if (state
                  is NotificationsListLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("Error No Notifications"),
                );
              }
            },
          ),
    );
  }
}
