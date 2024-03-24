part of 'widget.dart';

class CardWidget extends StatelessWidget {
  final double? width;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  const CardWidget({
    super.key,
    this.width,
    this.padding,
    this.margin,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? EdgeInsets.all(12),
      margin: margin ?? EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: backgroundColor ?? kWhiteSmokeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
