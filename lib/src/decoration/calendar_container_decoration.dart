import 'package:flutter/cupertino.dart';

class CalendarContainerDecoration {
  factory CalendarContainerDecoration({
    BorderRadius? borderRadius,
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    return CalendarContainerDecoration._(
      backgroundColor: CupertinoColors.systemBackground,
      boxShadow: boxShadow ??
          const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0.0, 10.0),
              blurRadius: 60.0,
            ),
          ],
      borderRadius:
          borderRadius ?? const BorderRadius.all(Radius.circular(13.0)),
    );
  }

  const CalendarContainerDecoration._({
    required this.borderRadius,
    required this.backgroundColor,
    required this.boxShadow,
  });

  factory CalendarContainerDecoration.withDynamicColor(
    BuildContext context, {
    BorderRadius? borderRadius,
    CupertinoDynamicColor? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    final CalendarContainerDecoration decoration =
        CalendarContainerDecoration();
    return decoration.copyWith(
      backgroundColor: CupertinoDynamicColor.resolve(
        backgroundColor ??
            CupertinoDynamicColor.withBrightness(
              color: CupertinoColors.systemBackground,
              darkColor: CupertinoColors.systemBackground.darkElevatedColor,
            ),
        context,
      ),
      boxShadow: boxShadow,
      borderRadius: borderRadius,
    );
  }

  final BorderRadius borderRadius;
  final Color backgroundColor;
  final List<BoxShadow> boxShadow;

  CalendarContainerDecoration copyWith({
    BorderRadius? borderRadius,
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    return CalendarContainerDecoration._(
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      boxShadow: boxShadow ?? this.boxShadow,
    );
  }
}
