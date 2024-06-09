part of 'internet_cubit.dart';

enum ConnectivityStatus { connected, disconnected, unknown }

class InternetStatus {
  final ConnectivityStatus status;

  const InternetStatus(this.status);
}
