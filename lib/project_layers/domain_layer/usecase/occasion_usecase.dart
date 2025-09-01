import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/repo/occasion_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/occasion_response_entity.dart';

@injectable
class OccasionUseCase {
  OccasionRepo occasionRepo;

  OccasionUseCase(this.occasionRepo);

  Future<ApiResult<List<OccasionEntity>>> call() async {
    final result = await occasionRepo.getOccasions();
    return result;
  }
}
