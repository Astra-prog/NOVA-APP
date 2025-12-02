import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

enum CustomCardType {
  elevated,
  glassmorphic,
  gradient,
}

class CustomCard extends StatelessWidget {
  final Widget child;
  final CustomCardType type;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final double? borderWidth;

  const CustomCard({
    super.key,
    required this.child,
    this.type = CustomCardType.elevated,
    this.onTap,
    this.padding,
    this.gradientColors,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Widget content = Padding(
      padding: padding ?? const EdgeInsets.all(AppTheme.spacingM),
      child: child,
    );

    switch (type) {
      case CustomCardType.elevated:
        return Card(
          child: onTap != null
              ? InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  child: content,
                )
              : content,
        );

      case CustomCardType.glassmorphic:
        return Container(
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: 0.05)
                : Colors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            border: Border.all(
              color: borderColor ??
                  (isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.white.withValues(alpha: 0.3)),
              width: borderWidth ?? 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            child: onTap != null
                ? InkWell(
                    onTap: onTap,
                    child: content,
                  )
                : content,
          ),
        );

      case CustomCardType.gradient:
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors ??
                  [
                    Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.7),
                    Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.7),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            child: onTap != null
                ? InkWell(
                    onTap: onTap,
                    child: content,
                  )
                : content,
          ),
        );
    }
  }
}
