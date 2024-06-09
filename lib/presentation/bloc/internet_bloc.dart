import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(message: 'connected'));
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState(message: 'Not connected'));
      }
    });

    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      
      if (results.any((result) => result == ConnectivityResult.wifi || result == ConnectivityResult.mobile)) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
