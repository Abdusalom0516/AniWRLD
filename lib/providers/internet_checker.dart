import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker extends ChangeNotifier{
   bool _isConnected = true;
  bool get isConnected => _isConnected;
  late StreamSubscription subscription;
  void internetConnectionListener() {
    subscription = InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            _isConnected = true;
            notifyListeners();
            break;
          case InternetStatus.disconnected:
            _isConnected = false;
            notifyListeners();
            break;
          default:
        }
      },
    );
  }
}