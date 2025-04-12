import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBorderBottom;
  final double borderWidth;
  final Color borderBottomColor;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget? leading;
  final TextStyle? titleStyle;
  final Widget actionButton;
  final double height;
  final bool centerTitle;

  const Header({
    super.key,
    required this.title,
    this.borderWidth = 1,
    this.borderBottomColor = Colors.black,
    this.showBorderBottom = false,
    this.centerTitle = false,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w600,
    this.leading,
    this.titleStyle,
    this.actionButton = const SizedBox(),
    this.height = 50,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: showBorderBottom ? borderBottomColor : Colors.transparent,
            width: borderWidth,
          ),
        ),
      ),
      child: SafeArea(
        child: AppBar(
          toolbarHeight: height,
          centerTitle: centerTitle,
          backgroundColor:
              backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          title: Text(
            title,
            style:
                titleStyle ??
                TextStyle(
                  color:
                      textColor ??
                      Theme.of(context).textTheme.titleLarge?.color ??
                      Colors.black,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
          ),
          actions: [actionButton],
          leading: leading,
        ),
      ),
    );
  }
}
