import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/api_layer/responses/best_seller_response.dart';

abstract class BestSellerRepo {
  Future<Either<Failures, BestSellerResponse>> bestSeller();
}
