import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryUseCase {
  final HomeRepo homeRepo;

  CategoryUseCase({required this.homeRepo});

  Future<Either<CategoryResponseEntity, Failures>> invoke() {
    return homeRepo.getCategories();
    }
}
