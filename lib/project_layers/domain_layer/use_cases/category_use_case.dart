import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

import '../repos/category_repo.dart';

@injectable
class CategoryUseCase {
  CategoryRepo categoryRepo;
  CategoryUseCase(this.categoryRepo);

  Future<ApiResult<List<CategoryEntity>>> call() async {
    final result = await categoryRepo.getAllCategories();
    return result;
  }
}
