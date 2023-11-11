import 'package:flutter/material.dart';

class PunkText extends StatelessWidget {
  final String? content;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Style textStyle;
  final Color? color;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;

  const PunkText.h1(
      {super.key,
      this.content,
      this.fontWeight,
      this.fontSize,
      this.textStyle = Style.h1,
      this.color,
      this.letterSpacing,
      this.maxLines,
      this.overflow});

  const PunkText.b1(
      {super.key,
      this.content,
      this.fontWeight,
      this.fontSize,
      this.textStyle = Style.b1,
      this.color,
      this.letterSpacing,
      this.maxLines,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      content ?? "",
      maxLines: maxLines,
      overflow: overflow,
      style: _getStyle(textStyle, context)!.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

enum Style { h1, b1 }

TextStyle? _getStyle(Style textStyle, BuildContext context) {
  switch (textStyle) {
    case Style.h1:
      {
        return Theme.of(context).textTheme.headline1;
      }
    case Style.b1:
      {
        return Theme.of(context).textTheme.bodyText1;
      }
  }
}
