import 'package:payments_app/blocs/token_fetch/token_event.dart';
import 'package:payments_app/blocs/token_fetch/token_state.dart';
import 'package:bloc/bloc.dart';

import '../../repository/api_repository.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  final ApiRepository apiRepository;

  TokenBloc({required this.apiRepository}) : super(TokenInitial()) {
    on<GetTokenData>((event, emit) async {
      emit(TokenLoading());
      try {
        final data = await apiRepository.fetchToken(
            orderId: event.orderId, orderAmount: event.orderAmount);
        emit(TokenLoaded(data));
        if (data.error != null) {
          emit(TokenError(data.error));
        }
      } on Error {
        emit(TokenError("Failed to connect"));
      }
    });
  }
}
