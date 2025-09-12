import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<CategoryResponseEntity , Failures>> getCategories();
  Future<Either<OccasionResponseEntity , Failures>> getOccasions();
  Future<Either<BestSellerResponseEntity , Failures>> getBestSellers();
}
