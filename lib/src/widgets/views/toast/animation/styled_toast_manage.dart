import 'dart:async';

import 'package:admiralui_flutter/src/widgets/views/toast/animation/styled_toast.dart';
import 'package:flutter/widgets.dart';

/// The method to dismiss all toast.
void dismissAllToast({bool showAnim = true}) {
  ToastManager().dismissAll(showAnim: showAnim);
}

/// The class for managing the overlay and dismiss.
///
/// Use the [dismiss] to dismiss toast.
/// When the Toast is dismissed, call [onDismiss] if specified.
class ToastFuture {

  ToastFuture.create(
    Duration duration,
    this._entry,
    this._onDismiss,
    this._containerKey,
  ) {
    if (duration != Duration.zero) {
      _timer = Timer(duration, () => dismiss());
    }
  }
  /// Toast overlay.
  final OverlayEntry _entry;

  /// Callback when toast dismiss.
  final VoidCallback? _onDismiss;

  ///Toast widget key.
  final GlobalKey<StyledToastWidgetState> _containerKey;

  ///Is toast showing.
  bool _isShow = true;

  /// A [Timer] used to dismiss this 
  /// toast future after the given period of time.
  Timer? _timer;

  /// Get the [_entry].
  OverlayEntry get entry => _entry;

  /// Get the [_onDismiss].
  VoidCallback? get onDismiss => _onDismiss;

  /// Get the [_isShow].
  bool get isShow => _isShow;

  /// Get the [_containerKey]
  GlobalKey get containerKey => _containerKey;

  /// Dismiss toast overlay.
  ///
  /// [showAnim] Can be used to dismiss a toast with animation effect or not.
  Future<void> dismiss({
    bool showAnim = false,
  }) async {
    if (!_isShow) {
      return;
    }

    _isShow = false;
    _timer?.cancel();
    _onDismiss?.call();
    ToastManager().removeFuture(this);
    if (showAnim) {
      await _containerKey.currentState?.dismissToastAnim();
    } else {
      _containerKey.currentState?.dismissToast();
    }
    _entry.remove();
  }
}

/// Toast manager, manage toast list.
class ToastManager {

  /// Factory to create [ToastManager] singleton.
  factory ToastManager() {
    _instance ??= ToastManager._();
    return _instance!;
  }

  ToastManager._();

  /// Instance of [ToastManager].
  static ToastManager? _instance;

  /// [Set] used to save [ToastFuture].
  Set<ToastFuture> toastSet = <ToastFuture>{};

  /// Dismiss all toast.
  void dismissAll({
    bool showAnim = false,
  }) {
    toastSet.toList().forEach((ToastFuture v) {
      v.dismiss(showAnim: showAnim);
    });
  }

  /// Remove [ToastFuture].
  void removeFuture(ToastFuture future) {
    toastSet.remove(future);
  }

  /// Add [ToastFuture].
  void addFuture(ToastFuture future) {
    toastSet.add(future);
  }
}
