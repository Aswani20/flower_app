import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/view_model/occasion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bar_occasion.dart';
import 'occation_body_builder.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OccasionCubit>()..getOccasions(),
      child: Scaffold(
        appBar: AppBarOccasion(),
        body: OccasionBodyBuilder(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
