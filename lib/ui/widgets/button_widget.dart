part of 'widget.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Widget? widget;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    this.text = '',
    this.widget,
    this.width,
    this.height,
    this.backgroundColor,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      // margin: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? kBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: isLoading
            ? SpinKitThreeBounce(
                color: kWhiteColor,
                size: 18,
              )
            : (text != ''
                ? Text(
                    text!,
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  )
                : widget),
      ),
    );
  }
}
