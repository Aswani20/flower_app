import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/data_layer/data_source/home_remote_data_spurce.dart';
import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiClient _apiClient;

  HomeRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<BestSellerResponseEntity, Failures>> getBestSellers() async {
    try {
      var response = await _apiClient.getBestSellers();
      var statusCode = response.response.statusCode;
      if (statusCode! >= 200 && statusCode < 300) {
        return Left(response.data);
      } else {
        return Right(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch (e) {
      return Right(
        ServerError(
          errorMessage: e.response?.data?.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return Right(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<CategoryResponseEntity, Failures>> getCategories() async {
    try {
      var response = await _apiClient.getCategories();
      var statusCode = response.response.statusCode;
      if (statusCode! >= 200 && statusCode < 300) {
        return Left(response.data);
      } else {
        return Right(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch (e) {
      return Right(
        ServerError(
          errorMessage: e.response?.data?.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return Right(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<OccasionResponseEntity, Failures>> getOccasions() async {
    try {
      var response = await _apiClient.getOccasions();
      var statusCode = response.response.statusCode;
      if (statusCode! >= 200 && statusCode < 300) {
        return Left(response.data);
      } else {
        return Right(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch (e) {
      return Right(
        ServerError(
          errorMessage: e.response?.data?.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return Right(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }
}
