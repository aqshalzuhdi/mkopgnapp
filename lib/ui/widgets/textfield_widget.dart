part of 'widget.dart';

class TextfieldWidget extends StatefulWidget {
  final String label;
  final bool obsecureText;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final Function(String)? onSubmitted;

  const TextfieldWidget({
    super.key,
    required this.label,
    required this.obsecureText,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecureText ? obsecureText : false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        isDense: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.all(14),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obsecureText = !obsecureText;
            });
          },
          child: (widget.obsecureText)
              ? Icon(
                  (obsecureText)
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: Colors.grey,
                )
              : SizedBox(),
        ),
      ),
      controller: widget.controller,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
    );
  }
}
