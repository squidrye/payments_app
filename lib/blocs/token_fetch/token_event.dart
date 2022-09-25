import 'package:equatable/equatable.dart';

abstract class TokenEvent extends Equatable{
  const TokenEvent();
  @override
  List<Object> get props => [];
}

class GetTokenData extends TokenEvent{
  final int orderId;
  final int orderAmount;

  const GetTokenData({required this.orderId, required this.orderAmount});

}