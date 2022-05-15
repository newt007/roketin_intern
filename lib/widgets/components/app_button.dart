import 'package:flutter/material.dart';

class ButtonOptions {
  const ButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final double? borderRadius;
  final BorderSide? borderSide;
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    required this.options,
    this.loading = false,
    Key? key,
  }) : super(key: key);

  final String? text;
  final Widget? icon;
  final IconData? iconData;
  final VoidCallback onPressed;
  final ButtonOptions? options;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    Widget _textWidget = loading!
        ? Center(
            child: Container(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    options!.textStyle!.color ?? Colors.white),
              ),
            ),
          )
        : Text(
            text!,
            style: options!.textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
          
    return Container(
      height: options!.height,
      width: options!.width,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(options!.borderRadius ?? 28),
            side: options!.borderSide ?? BorderSide.none),
        textColor: options!.textStyle!.color,
        color: options!.color,
        colorBrightness: ThemeData.estimateBrightnessForColor(options!.color!),
        disabledColor: options!.disabledColor,
        disabledTextColor: options!.disabledTextColor,
        padding: options!.padding,
        elevation: options!.elevation,
        child: _textWidget,
      ),
    );
  }
}
