import 'package:atria_assignment/core/constants/colors.dart';
import 'package:atria_assignment/core/utils/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.enabled = true,
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
    this.isPassword = false,
    this.isError = false,
  });

  final TextEditingController controller;
  final bool enabled;
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
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final bool isError;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isEyeOpened = false;

  @override
  void initState() {
    isEyeOpened = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: AppColors.black,
      textInputAction: widget.textInputAction,
      showCursor: true,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      enableSuggestions: true,
      obscureText: isEyeOpened,
      inputFormatters: widget.textInputType == TextInputType.phone ? [LengthLimitingTextInputFormatter(10)] : [],
      style: AppTextTheme.textStyle(fontSize: 15, color: AppColors.black),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hint: widget.hint,
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        enabled: widget.enabled,
        error: widget.isError
            ? AppTextTheme.textTheme(
                widget.errorText ?? "Oops! This field can’t be left blank",
                fontSize: 13,
                color: Colors.red,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.black.withAlpha((255 * 0.5).toInt()), width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.black.withAlpha((255 * 0.5).toInt()), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.black.withAlpha((255 * 0.5).toInt()), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.secondary, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        // suffix:
      ),
    );
  }
}
