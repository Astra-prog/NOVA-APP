import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/haptic_utils.dart';

enum CustomButtonType {
  elevated,
  outlined,
  text,
  gradient,
}

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonType type;
  final IconData? icon;
  final bool isLoading;
  final bool fullWidth;
  final List<Color>? gradientColors;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = CustomButtonType.elevated,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
    this.gradientColors,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.onPressed != null && !widget.isLoading) {
      _controller.forward();
      HapticUtils.lightImpact();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : widget.icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(widget.icon, size: 20),
                  const SizedBox(width: AppTheme.spacingS),
                  Text(widget.text),
                ],
              )
            : Text(widget.text);

    Widget button;

    switch (widget.type) {
      case CustomButtonType.elevated:
        button = ElevatedButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          child: content,
        );
        break;

      case CustomButtonType.outlined:
        button = OutlinedButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          child: content,
        );
        break;

      case CustomButtonType.text:
        button = TextButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          child: content,
        );
        break;

      case CustomButtonType.gradient:
        button = Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradientColors ??
                  [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            child: content,
          ),
        );
        break;
    }

    // Wrap button with scale animation
    final animatedButton = ScaleTransition(
      scale: _scaleAnimation,
      child: button,
    );

    // Wrap with gesture detector for press animation
    final interactiveButton = GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: animatedButton,
    );

    return widget.fullWidth
        ? SizedBox(
            width: double.infinity,
            child: interactiveButton,
          )
        : interactiveButton;
  }
}
