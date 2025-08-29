import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionUseCase {
  final HomeRepo homeRepo;

  OccasionUseCase({required this.homeRepo});

  Future<Either<OccasionResponseEntity, Failures>> invoke() {
    return homeRepo.getOccasions();
  }
}