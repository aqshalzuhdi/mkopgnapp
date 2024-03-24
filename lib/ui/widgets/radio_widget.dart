part of 'widget.dart';

class RadioWidget extends StatelessWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) onChanged;

  const RadioWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * .2,
      child: Row(
        children: [
          Container(
            width: 30,
            margin: EdgeInsets.zero,
            child: RadioListTile(
              // title: Text(title),
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width * .5,
            child: Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
    // BlocBuilder<CheckboxCubit, CheckboxState>(
    //   builder: (context, state) {
    //     return Row(
    //       children: [
    //         Container(
    //           width: 30,
    //           margin: EdgeInsets.zero,
    //           child: RadioListTile(
    //             value: value,
    //             groupValue: groupValue,
    //             selected: true,
    //             onChanged: (value) {
    //               // context.read<CheckboxCubit>().changeOption(value);
    //             },
    //           ),
    //         ),
    //         Text(title),
    //       ],
    //     );
    //   },
    // );
  }
}
