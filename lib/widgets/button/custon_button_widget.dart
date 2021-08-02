import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  final bool enabled;
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final bool outline;
  final bool shrinkWrap;
  final bool noBorder;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsets? padding;

  const CustomButtonWidget({
    Key? key,
    this.enabled = true,
    required this.text,
    this.textSize = 14,
    this.fontWeight = FontWeight.bold,
    this.outline = false,
    this.noBorder = false,
    required this.onPressed,
    this.color,
    this.padding,
    this.shrinkWrap = false,
  })  : assert(!noBorder || !outline,
            "noBorder and outline can't be active together."),
        super(key: key);

  @override
  _CustomButtonWidgetState createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ButtonTheme(
      materialTapTargetSize:
          widget.shrinkWrap ? MaterialTapTargetSize.shrinkWrap : null,
      height: widget.shrinkWrap ? 0 : 36,
      child: TextButton(
        onPressed: widget.enabled ? widget.onPressed : null,
        child: Text(
          widget.text,
          style: TextStyle(
            color: (widget.outline || widget.noBorder)
                ? widget.color ?? primaryColor
                : Colors.white,
            fontWeight: widget.fontWeight,
            fontSize: widget.textSize,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            (widget.outline || widget.noBorder)
                ? Colors.transparent
                : widget.color ?? primaryColor,
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            widget.padding,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: widget.noBorder
                  ? const BorderSide(color: Colors.transparent)
                  : widget.outline
                      ? BorderSide(color: widget.color ?? primaryColor)
                      : const BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
