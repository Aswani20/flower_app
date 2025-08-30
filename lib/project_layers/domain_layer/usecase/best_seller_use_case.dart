import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/api_layer/responses/best_seller_response.dart';
import 'package:flower_app/project_layers/domain_layer/repo/best_seller_repo.dart';
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
