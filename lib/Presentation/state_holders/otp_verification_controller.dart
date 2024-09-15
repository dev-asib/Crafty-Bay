import 'dart:async';

import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  static const _initialSeconds = 5;
  int _remainingSeconds = _initialSeconds;
  Timer? _timer;

  int get remainingSeconds => _remainingSeconds;

  bool get isTimerActive => _timer != null && _timer!.isActive;

  void startTimer() {
    if (isTimerActive) return;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
          update();
        } else {
          _stopTimer();
        }
      },
    );
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void onClose() {
    _stopTimer();
    super.onClose();
  }

  void resetTimer() {
    _stopTimer();
    _remainingSeconds = _initialSeconds;
    startTimer();
  }
}
