import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/network/network_checker.dart';
part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
 NetWorkChecker networkCheck = NetWorkChecker();
  NetworkBloc() : super(NetworkInitial()) {
    on<CheckConnectivity>((event, emit) async{
       try {
         if (kIsWeb) {
          emit(NetworkGood());
          return;
        }else {
          bool response = await networkCheck.isConnected();
          if (response) {
            emit(NetworkGood());
          }else{
            emit(NetworkBad(error: "Internet connection lost"));
          }
      

          await emit.forEach<bool>(
            networkCheck.connectionStream,
            onData: (connected){
              if(connected) return NetworkGood();
              return state;
            });
        }
       } catch (e) {
          NetworkBad(error: e.toString());
       }
    });
  }
}
