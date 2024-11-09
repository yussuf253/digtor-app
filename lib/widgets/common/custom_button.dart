import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.isFullWidth = true,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle =
        isOutlined ? AppStyles.outlinedButton : AppStyles.primaryButton;

    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: AppStyles.button.copyWith(
            color: isOutlined ? AppColors.primary : Colors.white,
          ),
        ),
      ],
    );

    final button = SizedBox(
      height: height ?? 56,
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: buttonStyle.copyWith(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                foregroundColor: WidgetStateProperty.all(textColor),
              ),
              child: buttonChild,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: buttonStyle.copyWith(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                foregroundColor: WidgetStateProperty.all(textColor),
              ),
              child: buttonChild,
            ),
    );

    return isFullWidth
        ? SizedBox(
            width: double.infinity,
            child: button,
          )
        : button;
  }
}
