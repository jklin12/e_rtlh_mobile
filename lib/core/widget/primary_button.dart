import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.btnColor,
    required this.textColor,
    required this.textButton,
    required this.onPressed,
    super.key,
    this.textStyle,
    this.borderSide = BorderSide.none,
    this.leading,
    this.verticalPadding = 16,
  });

  final Color btnColor;
  final Color textColor;
  final String textButton;
  final TextStyle? textStyle;
  final BorderSide borderSide;
  final VoidCallback? onPressed;
  final Widget? leading;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0.0,
        highlightElevation: 0.0,
        color: btnColor,
        disabledColor: btnColor.withOpacity(0.2),
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading != null ? leading! : const SizedBox.shrink(),
            Visibility(
              visible: leading != null,
              child: const SizedBox(width: 8),
            ),
            Text(
              textButton,
              textAlign: TextAlign.center,
              style: textStyle ??
                  TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
