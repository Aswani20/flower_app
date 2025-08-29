import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerUseCase {
  final HomeRepo homeRepo;

  BestSellerUseCase({required this.homeRepo});

  Future<Either<BestSellerResponseEntity, Failures>> invoke() {
    return homeRepo.getBestSellers();
  }
}