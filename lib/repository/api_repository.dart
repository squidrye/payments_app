import 'package:payments_app/Model/token.dart';
import 'api_provider.dart';

class ApiRepository{
  final _provider = ApiProvider();

  Future<Token> fetchToken({required int orderId, required int orderAmount}){
    return _provider.fetchToken(orderId:orderId, orderAmount: orderAmount);
  }
}