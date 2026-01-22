import 'package:atria_assignment/core/utils/app_text_theme.dart';
import 'package:atria_assignment/core/utils/extension/numbers_extension.dart';
import 'package:flutter/material.dart';

import 'app_text_field.dart';

class LabeledAppTextField extends StatelessWidget {
  const LabeledAppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.labelSize,
    this.enabled = true,
    this.isError = false,
    this.prefix,
    this.suffix,
    this.hint,
    this.contentPadding,
    this.maxLines,
    this.errorText,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.onTap,
    this.isPassword = false,
  });

  final String label;
  final double? labelSize;
  final TextEditingController controller;
  final bool enabled;
  final bool isError;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? hint;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final bool isPassword;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: AppTextTheme.textTheme(
            label,
            fontSize: labelSize ?? 14,
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        8.height,
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: !enabled && onTap != null ? onTap! : null,
          child: AppTextField(
            controller: controller,
            focusNode: focusNode,
            suffix: suffix,
            prefix: prefix,
            enabled: enabled,
            hint: hint,
            contentPadding: contentPadding,
            errorText: errorText,
            isPassword: isPassword,
            maxLines: isPassword ? 1 : maxLines,
            onChanged: onChanged,
            isError: isError,
            onFieldSubmitted: onFieldSubmitted,
            textInputAction: textInputAction,
            textInputType: textInputType,
          ),
        ),
      ],
    );
  }
}
