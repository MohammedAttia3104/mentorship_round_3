import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

/// Toast types for different message styles
enum ToastType { success, error, warning, info }

class ToastHelper {
  ///How to Use:
  /// ToastHelper.show(context, "This is a success message", type: ToastType.success);
  /// - [message] is the text to display
  /// - [type] defines the style of the toast (success, error, warning, info)
  /// - [position] sets where the toast appears on screen
  /// - [onDismiss] is an optional callback when the toast is dismissed

  static const Duration _toastDuration = Duration(seconds: 3);
  static const Duration _animDuration = Duration(milliseconds: 400);

  /// Public method to show a styled toast
  static void show(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    StyledToastPosition position = StyledToastPosition.bottom,
    VoidCallback? onDismiss,
  }) {
    final style = _getStyle(type);

    showToastWidget(
      _ToastContent(
        message: message,
        icon: style.icon,
        backgroundColor: style.backgroundColor,
        textColor: style.textColor,
      ),
      context: context,
      position: position,
      duration: _toastDuration,
      animDuration: _animDuration,
      animation: StyledToastAnimation.fadeScale,
      reverseAnimation: StyledToastAnimation.fadeScale,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
      onDismiss: onDismiss,
      dismissOtherToast: true,
    );
  }

  /// Internal: returns color/icon scheme based on toast type
  static _ToastStyle _getStyle(ToastType type) {
    switch (type) {
      case ToastType.success:
        return _ToastStyle(
          backgroundColor: Colors.green.shade600,
          icon: Icons.check_circle,
          textColor: Colors.white,
        );
      case ToastType.error:
        return _ToastStyle(
          backgroundColor: Colors.red.shade600,
          icon: Icons.error,
          textColor: Colors.white,
        );
      case ToastType.warning:
        return _ToastStyle(
          backgroundColor: Colors.orange.shade700,
          icon: Icons.warning_amber_rounded,
          textColor: Colors.white,
        );
      case ToastType.info:
        return _ToastStyle(
          backgroundColor: Colors.blueGrey.shade800,
          icon: Icons.info_outline,
          textColor: Colors.white,
        );
    }
  }
}

/// Model to define style attributes per toast type
class _ToastStyle {
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const _ToastStyle({
    required this.backgroundColor,
    required this.icon,
    required this.textColor,
  });
}

/// Custom widget that renders the toast content
class _ToastContent extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const _ToastContent({
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 20.sp),
          SizedBox(width: 8.w),
          Flexible(
            child: Text(
              message,
              style: TextStyle(color: textColor, fontSize: 14.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
