import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bloc/bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetStatus> {
  InternetCubit() : super(const InternetStatus(ConnectivityStatus.unknown)) {
    _init();
  }

  Future<void> _init() async {
    List<ConnectivityResult> initialResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(initialResult as ConnectivityResult);
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      // Check if the list of results is empty or not
      if (results.isNotEmpty) {
        // Use the first result from the list
        _updateConnectivityStatus(results.first);
      }
    });
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(const InternetStatus(ConnectivityStatus.disconnected));
    } else {
      emit(const InternetStatus(ConnectivityStatus.connected));
    }
  }
}
