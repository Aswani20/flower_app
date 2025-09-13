import 'package:flower_app/core/api_result/api_result.dart';

import '../entities/occasion_response_entity.dart';

abstract class OccasionRepo {
  Future<ApiResult<List<OccasionEntity>>> getOccasions();
}
