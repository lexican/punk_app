import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  Function? _onChangeCallback;

  ConnectivityService({Function? onChangeCallback}) {
    _connectivity.onConnectivityChanged.listen((_connectionChange));
    checkConnectivity();
    _onChangeCallback = onChangeCallback;
  }

  ConnectivityResult _connectionState = ConnectivityResult.none;
  ConnectivityResult? _previousConnectionState;

  bool hasConnectionChanged(ConnectivityResult? result) =>
      _previousConnectionState != null && _previousConnectionState != result;

  StreamController<bool>? connectionStream = StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();

  void _connectionChange(ConnectivityResult result) async {
    if (hasConnectionChanged(result)) {
      _connectionState = await (_connectivity.checkConnectivity());
      connectionStream!.add(result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi);
      _previousConnectionState = result;
      if (_onChangeCallback != null) {
        _onChangeCallback!();
      }
    }
  }

  Future checkConnectivity() async {
    try {
      _connectionState = await (_connectivity.checkConnectivity());
      _previousConnectionState = _connectionState;
    } catch (_) {}
    connectionStream!.add(_connectionState == ConnectivityResult.mobile ||
        _connectionState == ConnectivityResult.wifi);
  }

  void onChange() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  void dispose() {
    connectionStream!.close();
  }
}
