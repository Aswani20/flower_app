import 'package:dartz/dartz.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/data_layer/data_source/home_remote_data_spurce.dart';
import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<Either<BestSellerResponseEntity, Failures>> getBestSellers() async {
    var response = await _homeRemoteDataSource.getBestSellers();
    return response.fold((response) => Left(response), (error) => Right(error));
  }

  @override
  Future<Either<CategoryResponseEntity, Failures>> getCategories() async {
    var response = await _homeRemoteDataSource.getCategories();
    return response.fold((response) => Left(response), (error) => Right(error));
  }

  @override
  Future<Either<OccasionResponseEntity, Failures>> getOccasions() async {
    var response = await _homeRemoteDataSource.getOccasions();
    return response.fold((response) => Left(response), (error) => Right(error));
  }
}
