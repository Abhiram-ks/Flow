import 'package:bloc/bloc.dart';
import 'package:flow/flow/core/network/network_checker.dart';
import 'package:flutter/foundation.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  NetWorkChecker networkCheck = NetWorkChecker();
  SplashBloc() : super(SplashInitial()) {
    on<GotoHomeScreen>((event, emit) async {
      emit(SplashLoading());
      try {
        if (kIsWeb) {
          emit(GoToNavigate());
          return;
        }else {
          bool response = await networkCheck.isConnected();
          if (response) {
            emit(GoToNavigate());
          } else {
            emit(SplashFailure(error: "Internet connection lost"));

            await emit.forEach<bool>(
              networkCheck.connectionStream,
              onData: (connected) {
                if(connected) return GoToNavigate();
                return state;
              });
          }
        }
      } catch (e) {
        SplashFailure(error: e.toString());
      }
    });
  }
}
