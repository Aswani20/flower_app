import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';

abstract class CategoryRepo {
  Future<ApiResult<List<CategoryEntity>>> getAllCategories();
}
