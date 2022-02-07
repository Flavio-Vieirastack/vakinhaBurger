import 'dart:async';

import 'package:flutter/rendering.dart';

class DebouncerHelper {
  final int miliSeconds;
  final VoidCallback? action;
  Timer? _timer;
  DebouncerHelper({
    required this.miliSeconds,
    this.action,
    Timer? timer,
  }) : _timer = timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: miliSeconds), action);
  }
}
