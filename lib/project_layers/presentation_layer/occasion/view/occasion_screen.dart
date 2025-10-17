import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/view_model/occasion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/occation_body_builder.dart';

class occasionScreen extends StatelessWidget {
  const occasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<OccasionCubit>()..getOccasions(),
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n.occasion)),
        body: OccasionBodyBuilder(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
