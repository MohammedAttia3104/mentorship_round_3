import 'package:flutter/material.dart';

class FocusableDraggable extends StatefulWidget {
  final Color color;

  const FocusableDraggable({super.key, required this.color});

  @override
  State<FocusableDraggable> createState() => _FocusableDraggableState();
}

class _FocusableDraggableState extends State<FocusableDraggable> {
  bool _isFocused = false;
  bool _isHovered = false;

  void _setFocused(bool value) {
    setState(() {
      _isFocused = value;
    });
  }

  void _setHovered(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final showShadow = _isFocused || _isHovered;
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        onTapDown: (_) => _setFocused(true),
        onTapUp: (_) => _setFocused(false),
        onTapCancel: () => _setFocused(false),
        child: Draggable<Color>(
          data: widget.color,
          feedback: _buildDraggableChild(showShadow: true),
          childWhenDragging: _buildDraggableChild(opacity: 0.5),
          child: _buildDraggableChild(showShadow: showShadow),
        ),
      ),
    );
  }

  Widget _buildDraggableChild({bool showShadow = false, double opacity = 1.0}) {
    return Opacity(
      opacity: opacity,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.5),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        width: 45,
        height: 45,
      ),
    );
  }
}
