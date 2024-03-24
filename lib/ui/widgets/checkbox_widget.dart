part of 'widget.dart';

class CheckboxWidget extends StatelessWidget {
  final String? text;
  final bool checked;
  final ValueChanged<bool> onChanged;
  const CheckboxWidget({
    super.key,
    this.text,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // bool _checked = checked;
    context.read<CheckboxCubit>().changeValue(checked);
    return BlocBuilder<CheckboxCubit, CheckboxState>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            children: [
              RadioListTile(
                value: 1,
                groupValue: "asd",
                onChanged: (value) {},
              ),
              // ListTile(
              //   leading: index == 1
              //       ? Icon(Icons.check_box)
              //       : Icon(Icons.check_box_outline_blank),
              //   title: Text(
              //     1.toString(),
              //   ),
              // )
              // Container(
              //   width: 18,
              //   margin: EdgeInsets.zero,
              //   child: Checkbox(
              //     value: state.ischecked,
              //     onChanged: (value) {
              //       context.read<CheckboxCubit>().changeValue(value!);
              //       // _checked = state.ischecked;
              //       // onChanged(value);
              //     },
              //   ),
              //   // CheckboxListTile(
              //   //   value: checked,
              //   //   // value: StatusRadio.good,
              //   //   // groupValue: _statusGroup1,
              //   //   onChanged: (bool? status) {
              //   //     onChanged(status!);
              //   //   },
              //   // ),
              // ),
              // SizedBox(width: 8),
              // (text != null)
              //     ? Text(
              //         text!,
              //         style: blackTextStyle.copyWith(fontWeight: medium),
              //         maxLines: 1,
              //         overflow: TextOverflow.ellipsis,
              //       )
              //     : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
