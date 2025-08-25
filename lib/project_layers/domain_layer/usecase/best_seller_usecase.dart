import 'package:dartz/dartz.dart';
import 'package:flower_app/project_layers/api_layer/responses/best_seller_response.dart';
import 'package:flower_app/project_layers/domain_layer/repo/best_seller_repo.dart';

import '../../../core/errors/failures.dart';

class BestSellerUsecase {
  BestSellerRepo bestSellerRepo;

  BestSellerUsecase({required this.bestSellerRepo});

  Future<Either<Failures, BestSellerResponse>> call() async {
    return await bestSellerRepo.bestSeller();
  }
}
