import 'dart:io';

import 'package:flutter/foundation.dart';

import 'connection_manager.dart';

mixin ConnectionManagerImpl implements ConnectionManager {
  @override
  Future<void> checkConnection({
    required VoidCallback onConnected,
    required VoidCallback otherwise,
  }) async {
    if (await hasNetworkConnection) {
      onConnected.call();
    } else {
      otherwise.call();
    }
  }

  @override
  Future<bool> get hasNetworkConnection async {
    try {
      final result = await InternetAddress.lookup('cultivointeligente.com.br');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
