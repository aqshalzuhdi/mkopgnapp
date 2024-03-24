part of 'widget.dart';

class TextfieldKeyboardTypeWidget extends StatefulWidget {
  final String? label;
  final TextInputType keyboardType;
  final int maxLines;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final Function(String)? onSubmitted;

  const TextfieldKeyboardTypeWidget({
    super.key,
    this.label,
    required this.keyboardType,
    required this.maxLines,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  State<TextfieldKeyboardTypeWidget> createState() =>
      _TextfieldKeyboardTypeWidgetState();
}

class _TextfieldKeyboardTypeWidgetState
    extends State<TextfieldKeyboardTypeWidget> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label!,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: medium,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            // labelText: widget.label,
            isDense: true,
            contentPadding: widget.contentPadding ?? EdgeInsets.all(14),
          ),
          controller: widget.controller,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
        ),
      ],
    );
  }
}
