import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/domain_layer/repos/best_seller_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../entities/best_seller_response_entity.dart';

@injectable
class BestSellerUseCase {
  BestSellerRepo bestSellerRepo;

  BestSellerUseCase({required this.bestSellerRepo});

  Future<Either<BestSellerResponseEntity, Failures>> invoke() {
    return bestSellerRepo.getBestSellersProduct();
  }
}
