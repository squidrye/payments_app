import 'package:dio/dio.dart';

import '../Model/token.dart';

class ApiProvider {
  final String url = "https://chipped-blue-ease.glitch.me/cashfree";

  Future<Token> fetchToken({required int orderId, required int orderAmount}) async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        "https://chipped-blue-ease.glitch.me/cashfree",
        data: {
          "orderId": orderId,
          "orderAmount": orderAmount,
          "orderCurrency": "INR",
        },
        );
      print(response);
      return Token.fromJson(response.data);
    } catch (e, s) {
      print(e);
      return Token.withError("Data can't be fetched" + e.toString());
    }
  }
}
