
import 'package:equatable/equatable.dart';

import '../../Model/token.dart';

abstract class TokenState extends Equatable{

}

class TokenInitial extends TokenState {
  @override
  List<Object?> get props => [];
}

class TokenLoading extends TokenState {
  @override
  List<Object?> get props => [];
}

class TokenLoaded extends TokenState {
  Token data;
  TokenLoaded(this.data);
  @override
  List<Object?> get props => [];
}

class TokenError extends TokenState {
  final String? message;
  TokenError(this.message);

  @override
  List<Object?> get props => [];

}