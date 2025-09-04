import 'package:flower_app/core/errors/failures.dart';
import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/data_layer/data_source/cart_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource{
  final ApiClient _apiClient;
  CartRemoteDataSourceImpl(this._apiClient);

  @override
  Future<CartResponseEntity> getCart() async{
    try{
      var response = await _apiClient.getCart();
      var statusCode = response.response.statusCode ?? 500;
      var cartData = response.data;
      if (statusCode >= 200 && statusCode < 300) {
        return cartData.toEntity();
      }
      else{
        throw ServerError(errorMessage: cartData.message ?? "Server Error");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }

  }

  @override
  Future<CartResponseEntity> addToCart(String productId, {int quantity = 1}) async{
    try{
      var response = await _apiClient.addToCart({"productId" : productId, "quantity" : quantity});
      var statusCode = response.response.statusCode ?? 500;
      var cartData = response.data;
      if (statusCode >= 200 && statusCode < 300) {
        return cartData.toEntity();
      }else{
        throw ServerError(errorMessage: cartData.message ?? "Server Error");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }

  }

  @override
  Future<CartResponseEntity> updateCartItem(String itemId, int qty) async{
    try{
      var response = await _apiClient.updateCart(itemId, {"quantity" : qty});
      var statusCode = response.response.statusCode ?? 500;
      var cartData = response.data;
      if (statusCode >= 200 && statusCode < 300) {
        return cartData.toEntity();
      }else{
        throw ServerError(errorMessage: cartData.message ?? "Server Error");
      }
    }
    catch (e) {
    throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<void> clearCart() async{
    final res = await _apiClient.clearCart();
    final code = res.response.statusCode ?? 500;
    if (code >= 200 && code < 300) return;
    throw ServerError(errorMessage: 'Server Error');
  }

  @override
  Future<CartResponseEntity> removeItemFromCart(String itemId) async{
    var response =await _apiClient.removeItemFromCart(itemId);
    var statusCode = response.response.statusCode ?? 500;
    var cartData = response.data;
    if (statusCode >= 200 && statusCode < 300) {
      return cartData.toEntity();
    }else{
      throw ServerError(errorMessage: cartData.message ?? "Server Error");
    }
  }
}